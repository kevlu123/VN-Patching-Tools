using System.Text;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// An ARC file header.
/// </summary>
public record ArcHeader
{
    internal const int Size = 8;

    /// <summary>
    /// The number of files in the ARC file.
    /// </summary>
    public required int FileCount { get; init; }

    /// <summary>
    /// The total length of the all the subheaders in bytes.
    /// </summary>
    public required int SubHeaderLen { get; init; }
}

/// <summary>
/// An ARC file subheader describing a subfile.
/// </summary>
public record ArcSubHeader
{
    internal int Size => 10 + Encoding.Unicode.GetByteCount(Filename);

    /// <summary>
    /// The length of the subfile data in bytes.
    /// </summary>
    public required int DataLen { get; init; }

    /// <summary>
    /// The offset of the subfile data in the ARC file
    /// relative to the end of the subheaders.
    /// </summary>
    public required int DataOffset { get; init; }

    /// <summary>
    /// The filename of the subfile.
    /// </summary>
    public required string Filename { get; init; }
}

/// <summary>
/// A game archive file.
/// </summary>
public sealed class ArcFile : IArchive<ArcFile>
{
    /// <summary>
    /// The ARC file header.
    /// </summary>
    public ArcHeader Header { get; }

    /// <summary>
    /// The ARC file subheaders.
    /// The keys are the filenames with extensions.
    /// The keys are case-insensitive.
    /// </summary>
    public IReadOnlyDictionary<string, ArcSubHeader> SubHeaders => subHeaders.AsReadOnly();

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    private readonly SortedDictionary<string, ArcSubHeader> subHeaders;
    private bool disposedValue;

    private ArcFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);
        Header = new ArcHeader
        {
            FileCount = reader.ReadNonnegativeInt32(),
            SubHeaderLen = reader.ReadNonnegativeInt32(),
        };

        subHeaders = new SortedDictionary<string, ArcSubHeader>(StringComparer.InvariantCultureIgnoreCase);
        int position = ArcHeader.Size + Header.SubHeaderLen;
        for (var i = 0; i < Header.FileCount; i++)
        {
            var subHeader = new ArcSubHeader
            {
                DataLen = reader.ReadNonnegativeInt32(),
                DataOffset = reader.ReadNonnegativeInt32(),
                Filename = reader.ReadUTF16String(),
            };
            subHeaders.Add(subHeader.Filename, subHeader);
            checked
            {
                position += subHeader.DataLen;
            }
        }

        var actualSubHeaderLen = reader.Position - ArcHeader.Size;
        if (Header.SubHeaderLen != actualSubHeaderLen)
        {
            throw new DecodeException("Subheader length field does not match actual length.");
        }

        var expectedTotalLen = ArcHeader.Size
            + Header.SubHeaderLen
            + subHeaders.Values.Sum(sh => sh.DataLen);
        if (stream.Length != expectedTotalLen)
        {
            throw new InvalidDataException("Calculated total length does not match actual length.");
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = Header.FileCount == 0
            ? DecodeConfidence.Low
            : DecodeConfidence.High;
    }

    private ArcFile(IDictionary<string, BinaryStream> contents)
    {
        // Create subheaders
        var position = 0;
        subHeaders = new SortedDictionary<string, ArcSubHeader>(StringComparer.InvariantCultureIgnoreCase);
        foreach (var (filename, stream) in contents.OrderBy(kv => kv.Key))
        {
            subHeaders.Add(filename, new ArcSubHeader
            {
                DataLen = stream.Length,
                DataOffset = position,
                Filename = filename,
            });
            checked
            {
                position += stream.Length;
            }
        }

        // Create header
        var subHeaderLen = subHeaders.Values.Sum(sh => sh.Size);
        Header = new ArcHeader
        {
            FileCount = subHeaders.Count,
            SubHeaderLen = subHeaderLen,
        };

        // Create stream
        var totalLen = ArcHeader.Size + Header.SubHeaderLen + position;
        Stream = new BinaryStream(totalLen);
        var writer = new BinaryWriter(Stream);
        writer.WriteInt32(Header.FileCount);
        writer.WriteInt32(Header.SubHeaderLen);
        foreach (var subHeader in subHeaders.Values)
        {
            writer.WriteInt32(subHeader.DataLen);
            writer.WriteInt32(subHeader.DataOffset);
            writer.WriteUTF16String(subHeader.Filename);
        }
        foreach (var filename in subHeaders.Keys)
        {
            var stream = contents[filename];
            writer.WriteBytes(stream.Span);
        }

        Stream.Freeze();
    }

    /// <summary>
    /// Decodes an ARC file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static ArcFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new ArcFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs an ARC file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static ArcFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new ArcFile(contents));
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
        return subHeaders
            .Values
            .Select(sh => new FileInfo
            {
                Filename = sh.Filename,
                FileSize = sh.DataLen,
            })
            .ToList();
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
        if (!subHeaders.TryGetValue(filename, out var subHeader))
        {
            throw new FileNotFoundException(filename);
        }
        var offset = ArcHeader.Size + Header.SubHeaderLen + subHeader.DataOffset;
        var substream = Stream.SubStream(offset, subHeader.DataLen);
        return Task.FromResult(substream);
    }

    /// <summary>
    /// Disposes the ARC file.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// Disposes the ARC file.
    /// </summary>
    ~ArcFile()
    {
        Dispose();
    }
}
