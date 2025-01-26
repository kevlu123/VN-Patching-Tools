using System.Collections.Immutable;

namespace Ws2Explorer;

public record PanHeader
{
    internal const int Size = 8;

    public required int Signature { get; init; }
    public required int EntryCount { get; init; }
}

public record PanEntry
{
    internal int Size => 1 + SjisEncoding.Encoding.GetByteCount(CharacterName)
        + SubEntries.Sum(se => se.Size);

    public required string CharacterName { get; init; }
    public required int SubEntryCount { get; init; }
    public required ImmutableArray<PanSubEntry> SubEntries { get; init; }
}

public record PanSubEntry
{
    internal int Size => 6 + SjisEncoding.Encoding.GetByteCount(Filename);

    public required float Unknown00 { get; init; }
    public required byte Unknown04 { get; init; }
    public required string Filename { get; init; }
}

public sealed class PanFile : IArchive<PanFile>
{
    public BinaryStream Stream { get; }

    public PanHeader Header { get; }

    public IReadOnlyList<PanEntry> Entries => entries.AsReadOnly();

    private readonly byte[] jsonForm;
    private readonly List<PanEntry> entries;
    private bool disposedValue;

    private const int SIGNATURE = 0x324E4150;

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

    public static PanFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PanFile(stream, out var c), c),
            out confidence);
    }

    public static PanFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PanFile(contents));
    }

    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo
            {
                // This folder's child is nameless - any name will identify the child
                Filename = "Pan.json",
                FileSize = jsonForm.Length
            },
        ];
    }

    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        return Task.FromResult(new BinaryStream(jsonForm));
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

    ~PanFile()
    {
        Dispose();
    }
}
