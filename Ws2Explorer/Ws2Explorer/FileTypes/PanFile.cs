using System.Collections.Immutable;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A PAN file header.
/// </summary>
public record PanHeader
{
    internal const int Size = 8;

    /// <summary>
    /// The signature (PAN2).
    /// </summary>
    public required int Signature { get; init; }

    /// <summary>
    /// The number of entries in the PAN file.
    /// </summary>
    public required int EntryCount { get; init; }
}

/// <summary>
/// A PAN file entry.
/// </summary>
public record PanEntry
{
    internal int Size => 1 + SjisEncoding.Encoding.GetByteCount(CharacterName)
        + SubEntries.Sum(se => se.Size);

    /// <summary>
    /// The name of the character. The purpose is unknown.
    /// </summary>
    public required string CharacterName { get; init; }

    /// <summary>
    /// The number of sub-entries.
    /// </summary>
    public required int SubEntryCount { get; init; }

    /// <summary>
    /// The sub-entries.
    /// </summary>
    public required ImmutableArray<PanSubEntry> SubEntries { get; init; }
}

/// <summary>
/// A PAN file sub-entry.
/// </summary>
public record PanSubEntry
{
    internal int Size => 6 + SjisEncoding.Encoding.GetByteCount(Filename);

    /// <summary>
    /// Unknown.
    /// </summary>
    public required float Unknown00 { get; init; }

    /// <summary>
    /// Unknown.
    /// </summary>
    public required byte Unknown04 { get; init; }

    /// <summary>
    /// The filename. The purpose is unknown.
    /// </summary>
    public required string Filename { get; init; }
}

/// <summary>
/// A PAN file. (audio panning?)
/// </summary>
public sealed class PanFile : IArchive<PanFile>
{
    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The PAN file header.
    /// </summary>
    public PanHeader Header { get; }

    /// <summary>
    /// The entries in the PAN file.
    /// </summary>
    public IReadOnlyList<PanEntry> Entries => entries.AsReadOnly();

    private readonly byte[] jsonForm;
    private readonly List<PanEntry> entries;
    private bool disposedValue;

    /// <summary>
    /// The PAN file signature (PAN2).
    /// </summary>
    public const int SIGNATURE = 0x324E4150;

    private PanFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        Header = new PanHeader
        {
            Signature = reader.ReadInt32(),
            EntryCount = reader.ReadNonnegativeInt32(),
        };
        if (Header.Signature != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        entries = [];
        for (int i = 0; i < Header.EntryCount; i++)
        {
            var characterName = reader.ReadSjisString();
            int subEntryCount = reader.ReadNonnegativeInt32();
            var subEntries = new List<PanSubEntry>(subEntryCount);
            for (int j = 0; j < subEntryCount; j++)
            {
                subEntries.Add(new PanSubEntry
                {
                    Unknown00 = reader.ReadFloat32(),
                    Unknown04 = reader.ReadUInt8(),
                    Filename = reader.ReadSjisString(),
                });
            }
            entries.Add(new PanEntry
            {
                CharacterName = characterName,
                SubEntryCount = subEntryCount,
                SubEntries = [.. subEntries],
            });
        }

        jsonForm = JsonSerializer.SerializeToUtf8Bytes(entries);

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    private PanFile(IDictionary<string, BinaryStream> contents)
    {
        if (contents.Count != 1)
        {
            throw new DecodeException("Invalid number of files.");
        }
        entries = JsonSerializer.Deserialize<List<PanEntry>>(contents.Single().Value.Span);
        Header = new PanHeader
        {
            Signature = SIGNATURE,
            EntryCount = entries.Count,
        };
        jsonForm = JsonSerializer.SerializeToUtf8Bytes(entries);

        var totalLen = PanHeader.Size + entries.Sum(e => e.Size);
        Stream = new BinaryStream(totalLen);
        var writer = new BinaryWriter(Stream);
        writer.WriteInt32(Header.Signature);
        writer.WriteInt32(Header.EntryCount);
        foreach (var entry in entries)
        {
            writer.WriteSjisString(entry.CharacterName);
            writer.WriteInt32(entry.SubEntries.Length);
            foreach (var subEntry in entry.SubEntries)
            {
                writer.WriteFloat32(subEntry.Unknown00);
                writer.WriteUInt8(subEntry.Unknown04);
                writer.WriteSjisString(subEntry.Filename);
            }
        }

        Stream.Freeze();
    }

    /// <summary>
    /// Decodes a PAN file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static PanFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PanFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a PAN file from subfiles.
    /// Only one file is allowed, containing the JSON form of the PAN file.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static PanFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PanFile(contents));
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
    /// Lists the virtual subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo
            {
                Filename = "Pan.json",
                FileSize = jsonForm.Length
            },
        ];
    }

    /// <summary>
    /// Opens the JSON view of the PAN file.
    /// The filename passed is not used and can be anything.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        return Task.FromResult(new BinaryStream(jsonForm));
    }

    /// <summary>
    /// Disposes the PAN file.
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
    /// Disposes the PAN file.
    /// </summary>
    ~PanFile()
    {
        Dispose();
    }
}
