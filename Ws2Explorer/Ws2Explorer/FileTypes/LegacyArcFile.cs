using System.Text;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A legacy ARC group header.
/// </summary>
public record LegacyArcGroupHeader
{
    internal const int Size = 12;

    /// <summary>
    /// The 3-byte file extension of the files in the group excluding the dot.
    /// </summary>
    public required string GroupExtension { get; init; }

    /// <summary>
    /// The number of files in the group.
    /// </summary>
    public required int FileCount { get; init; }

    /// <summary>
    /// The offset from the beginning of the file
    /// of the file listing data of this group.
    /// </summary>
    public required int DataOffset { get; init; }
}

/// <summary>
/// A legacy ARC subheader describing a subfile.
/// </summary>
public record LegacyArcSubHeader
{
    /// <summary>
    /// The filename of the subfile excluding the dot and extension.
    /// This has a maximum length of 8 or 12 bytes depending on the archive version.
    /// </summary>
    public required string Filename { get; init; }

    /// <summary>
    /// The length of the subfile data in bytes.
    /// </summary>
    public required int DataLen { get; init; }

    /// <summary>
    /// The offset from the beginning of the file
    /// of the subfile data.
    /// </summary>
    public required int DataOffset { get; init; }
}

internal sealed class LegacyArcFileBase : IDisposable
{
    public int GroupCount { get; }

    public IReadOnlyList<LegacyArcGroupHeader> GroupHeaders => groupHeaders.AsReadOnly();

    public IReadOnlyDictionary<string, LegacyArcSubHeader> SubHeaders => subHeaders.AsReadOnly();

    public BinaryStream Stream { get; }

    private readonly SortedDictionary<string, LegacyArcSubHeader> subHeaders;
    private readonly List<LegacyArcGroupHeader> groupHeaders;
    private bool disposedValue;

    public LegacyArcFileBase(BinaryStream stream, int maxNameLength, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);
        GroupCount = reader.ReadNonnegativeInt32();

        groupHeaders = [];
        for (int i = 0; i < GroupCount; i++)
        {
            var ext = reader.ReadUTF8String();
            if (Encoding.UTF8.GetByteCount(ext) != 3)
            {
                throw new DecodeException("Invalid group extension length.");
            }
            groupHeaders.Add(new LegacyArcGroupHeader
            {
                GroupExtension = ext,
                FileCount = reader.ReadNonnegativeInt32(),
                DataOffset = reader.ReadNonnegativeInt32(),
            });
        }

        var readerPosition = reader.Position;
        subHeaders = new SortedDictionary<string, LegacyArcSubHeader>(StringComparer.InvariantCultureIgnoreCase);

        foreach (var groupHeader in groupHeaders)
        {
            for (int i = 0; i < groupHeader.FileCount; i++)
            {
                var name = reader.ReadUTF8String();
                if (Encoding.UTF8.GetByteCount(name) > maxNameLength)
                {
                    throw new DecodeException("Filename exceeds maximum length.");
                }
                // UTF8 or SJIS?
                reader.Skip(maxNameLength - Encoding.UTF8.GetByteCount(name));
                var nameWithExt = name + '.' + groupHeader.GroupExtension;
                subHeaders.Add(nameWithExt, new LegacyArcSubHeader
                {
                    Filename = name,
                    DataLen = reader.ReadNonnegativeInt32(),
                    DataOffset = reader.ReadNonnegativeInt32(),
                });
            }
        }

        int pos = reader.Position;
        for (int i = 0; i < subHeaders.Count; i++)
        {
            var matches = subHeaders.Values
                .Where(sh => sh.DataOffset == pos)
                .ToList();
            if (matches.Count == 0)
            {
                throw new DecodeException("Unused data section.");
            }
            else if (matches.Count > 1)
            {
                throw new DecodeException("Multiple data sections at the same position.");
            }
            pos += matches[0].DataLen;
        }
        if (pos != stream.Length)
        {
            throw new DecodeException("Data section does not match stream length.");
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = subHeaders.Count == 0
            ? DecodeConfidence.Low
            : DecodeConfidence.High;
    }

    public LegacyArcFileBase(IDictionary<string, BinaryStream> contents, int maxNameLength)
    {
        var groups = contents.GroupBy(kvp => Path.GetExtension(kvp.Key).TrimStart('.'))
            .ToDictionary(ext => ext.Key, ext => ext.ToDictionary());
        if (groups.ContainsKey(string.Empty))
        {
            throw new ArchiveCreationException("Legacy ARC files cannot contain files without an extension.");
        }

        GroupCount = groups.Count;
        groupHeaders = [];
        subHeaders = new SortedDictionary<string, LegacyArcSubHeader>(StringComparer.InvariantCultureIgnoreCase);
        var subHeaderList = new List<LegacyArcSubHeader>();

        var position = 4 + (LegacyArcGroupHeader.Size * GroupCount);
        foreach (var (ext, group) in groups)
        {
            groupHeaders.Add(new LegacyArcGroupHeader
            {
                GroupExtension = ext,
                DataOffset = position,
                FileCount = group.Count,
            });
            foreach (var (nameWithExt, _) in group)
            {
                var name = Path.GetFileNameWithoutExtension(nameWithExt);
                position += maxNameLength + 9;
            }
        }

        foreach (var (_, group) in groups)
        {
            foreach (var (nameWithExt, childStream) in group)
            {
                var name = Path.GetFileNameWithoutExtension(nameWithExt);
                var subHeader = new LegacyArcSubHeader
                {
                    Filename = name,
                    DataOffset = position,
                    DataLen = childStream.Length,
                };
                subHeaderList.Add(subHeader);
                subHeaders.Add(nameWithExt, subHeader);
                position += subHeader.DataLen;
            }
        }

        Stream = new BinaryStream(position);
        var writer = new BinaryWriter(Stream);
        writer.WriteInt32(GroupCount);
        foreach (var groupHeader in groupHeaders)
        {
            writer.WriteUTF8String(groupHeader.GroupExtension);
            writer.WriteInt32(groupHeader.FileCount);
            writer.WriteInt32(groupHeader.DataOffset);
        }
        foreach (var subHeader in subHeaderList)
        {
            writer.WriteUTF8String(subHeader.Filename);
            writer.WriteBytes(new byte[maxNameLength - Encoding.UTF8.GetByteCount(subHeader.Filename)]);
            writer.WriteInt32(subHeader.DataLen);
            writer.WriteInt32(subHeader.DataOffset);
        }
        foreach (var (_, group) in groups)
        {
            foreach (var (_, childStream) in group)
            {
                writer.WriteBytes(childStream.Span);
            }
        }
        Stream.Freeze();
    }

    public List<FileInfo> ListFiles()
    {
        return subHeaders
            .Select(sh => new FileInfo
            {
                Filename = sh.Key,
                FileSize = sh.Value.DataLen,
            })
            .ToList();
    }

    public Task<BinaryStream> OpenFile(string filename)
    {
        if (!subHeaders.TryGetValue(filename, out var subHeader))
        {
            throw new FileNotFoundException(filename);
        }
        var substream = Stream.SubStream(subHeader.DataOffset, subHeader.DataLen);
        return Task.FromResult(substream);
    }

    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    ~LegacyArcFileBase()
    {
        Dispose();
    }
}

/// <summary>
/// A game archive file used in older games.
/// This archive version has a max length of 8 bytes for filenames
/// excluding the dot and extension.
/// </summary>
public sealed class LegacyArc8File : IArchive<LegacyArc8File>
{
    private readonly LegacyArcFileBase baseFile;

    /// <summary>
    /// The number of groups (different file extensions) in the legacy ARC file.
    /// </summary>
    public int GroupCount => baseFile.GroupCount;

    /// <summary>
    /// The list of group headers.
    /// </summary>
    public IReadOnlyList<LegacyArcGroupHeader> GroupHeaders => baseFile.GroupHeaders;

    /// <summary>
    /// The subheaders describing each subfile.
    /// The keys are the filenames with extensions.
    /// The keys are case-insensitive.
    /// </summary>
    public IReadOnlyDictionary<string, LegacyArcSubHeader> SubHeaders => baseFile.SubHeaders;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream => baseFile.Stream;

    private LegacyArc8File(BinaryStream stream, out DecodeConfidence confidence)
    {
        baseFile = new LegacyArcFileBase(stream, 8, out confidence);
    }

    private LegacyArc8File(IDictionary<string, BinaryStream> contents)
    {
        baseFile = new LegacyArcFileBase(contents, 8);
    }

    /// <summary>
    /// Decodes a legacy ARC file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static LegacyArc8File Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new LegacyArc8File(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a legacy ARC file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static LegacyArc8File Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new LegacyArc8File(contents));
    }

    /// <summary>
    /// See <see cref="Create(IDictionary{string, BinaryStream})"/>.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    /// <summary>
    /// Lists the subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        return baseFile.ListFiles();
    }

    /// <summary>
    /// Opens a subfile.
    /// The filename is case-insensitive.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return baseFile.OpenFile(filename);
    }

    /// <summary>
    /// Disposes the legacy ARC file.
    /// </summary>
    public void Dispose()
    {
        baseFile?.Dispose();
    }
}

/// <summary>
/// A game archive file used in older games.
/// This archive version has a max length of 12 bytes for filenames
/// excluding the dot and extension.
/// </summary>
public sealed class LegacyArc12File : IArchive<LegacyArc12File>
{
    private readonly LegacyArcFileBase baseFile;

    /// <summary>
    /// The number of groups (different file extensions) in the legacy ARC file.
    /// </summary>
    public int GroupCount => baseFile.GroupCount;

    /// <summary>
    /// The list of group headers.
    /// </summary>
    public IReadOnlyList<LegacyArcGroupHeader> GroupHeaders => baseFile.GroupHeaders;

    /// <summary>
    /// The subheaders describing each subfile.
    /// The keys are the filenames with extensions.
    /// The keys are case-insensitive.
    /// </summary>
    public IReadOnlyDictionary<string, LegacyArcSubHeader> SubHeaders => baseFile.SubHeaders;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream => baseFile.Stream;

    private LegacyArc12File(BinaryStream stream, out DecodeConfidence confidence)
    {
        baseFile = new LegacyArcFileBase(stream, 12, out confidence);
    }

    private LegacyArc12File(IDictionary<string, BinaryStream> contents)
    {
        baseFile = new LegacyArcFileBase(contents, 12);
    }

    /// <summary>
    /// Decodes a legacy ARC file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static LegacyArc12File Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new LegacyArc12File(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a legacy ARC file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static LegacyArc12File Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new LegacyArc12File(contents));
    }

    /// <summary>
    /// See <see cref="Create(IDictionary{string, BinaryStream})"/>.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    /// <summary>
    /// Lists the subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        return baseFile.ListFiles();
    }

    /// <summary>
    /// Opens a subfile.
    /// The filename is case-insensitive.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return baseFile.OpenFile(filename);
    }

    /// <summary>
    /// Disposes the legacy ARC file.
    /// </summary>
    public void Dispose()
    {
        baseFile?.Dispose();
    }
}
