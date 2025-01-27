using System.Collections.Immutable;
using System.Text.Json.Serialization;

namespace Ws2Explorer;

public record PnaHeader
{
    internal const int Size = 20;

    public required int Signature { get; init; }
    public required int Unknown04 { get; init; }
    public required int ImageWidth { get; init; }
    public required int ImageHeight { get; init; }
    public required int FileCount { get; init; }

    [JsonConstructor]
    public PnaHeader(int signature, int unknown04, int imageWidth, int imageHeight, int fileCount)
        => (Signature, Unknown04, ImageWidth, ImageHeight, FileCount)
        = (signature, unknown04, imageWidth, imageHeight, fileCount);
    public PnaHeader() { }
}

public record PnaImageMetadata
{
    internal const int Size = 40;

    public required int Unknown00 { get; init; }
    public required int FileId { get; init; }
    public required int OffsetX { get; init; }
    public required int OffsetY { get; init; }
    public required int Width { get; init; }
    public required int Height { get; init; }
    public required int Unknown24 { get; init; }
    public required double Transparency { get; init; }
    public required int DataLen { get; init; }

    [JsonConstructor]
    public PnaImageMetadata(int unknown00, int fileId, int offsetX, int offsetY, int width, int height, int unknown24, double transparency, int dataLen)
        => (Unknown00, FileId, OffsetX, OffsetY, Width, Height, Unknown24, Transparency, DataLen)
        = (unknown00, fileId, offsetX, offsetY, width, height, unknown24, transparency, dataLen);
    public PnaImageMetadata() { }
}

public sealed class PnaFile : IArchive<PnaFile>
{
    public const int SIGNATURE = 0x50414E50;
    public const string HEADER_FILENAME = "header.json";

    public PnaHeader Header { get; }
    public ImmutableArray<PnaImageMetadata> ImageMetadata => [.. imageMetas];

    private readonly List<PnaImageMetadata> imageMetas;
    private bool disposedValue;

    public BinaryStream Stream { get; }

    private PnaFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        Header = new PnaHeader
        {
            Signature = reader.ReadInt32(),
            Unknown04 = reader.ReadInt32(),
            ImageWidth = reader.ReadNonnegativeInt32(),
            ImageHeight = reader.ReadNonnegativeInt32(),
            FileCount = reader.ReadNonnegativeInt32(),
        };
        if (Header.Signature != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        imageMetas = [];
        for (var i = 0; i < Header.FileCount; i++)
        {
            imageMetas.Add(new PnaImageMetadata
            {
                Unknown00 = reader.ReadInt32(),
                FileId = reader.ReadInt32(),
                OffsetX = reader.ReadInt32(),
                OffsetY = reader.ReadInt32(),
                Width = reader.ReadNonnegativeInt32(),
                Height = reader.ReadNonnegativeInt32(),
                Unknown24 = reader.ReadInt32(),
                Transparency = reader.ReadFloat64(),
                DataLen = reader.ReadNonnegativeInt32(),
            });
        }

        var expectedTotalLen = PnaHeader.Size
            + (Header.FileCount * PnaImageMetadata.Size)
            + imageMetas.Sum(meta => meta.DataLen);
        if (stream.Length != expectedTotalLen)
        {
            throw new DecodeException("Invalid file size.");
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    private PnaFile(IDictionary<string, BinaryStream> contents)
    {
        var pngs = new List<PngFile?>();
        var metaStreams = new List<BinaryStream>();
        BinaryStream? headerStream = null;

        var exampleMeta = new BinaryStream(
            JsonSerializer.SerializeToUtf8Bytes(new PnaImageMetadata
            {
                Unknown00 = 0,
                FileId = 0,
                OffsetX = 0,
                OffsetY = 0,
                Width = PngFile.Example.ImageHeight,
                Height = PngFile.Example.ImageWidth,
                Unknown24 = 0,
                Transparency = 1.0,
                DataLen = 0,
            }));

        foreach (var (name, stream) in contents)
        {
            if (name == HEADER_FILENAME)
            {
                headerStream = stream;
                continue;
            }

            int? imageIndex = ImageIndex(name);
            int? metaIndex = MetaIndex(name);
            int index = imageIndex ?? metaIndex ?? throw new ArchiveCreationException($"Invalid file name '{name}'.");

            while (pngs.Count <= index)
            {
                pngs.Add(PngFile.Example);
            }
            while (metaStreams.Count <= index)
            {
                metaStreams.Add(exampleMeta);
            }

            if (imageIndex != null)
            {
                if (stream.Length == 0)
                {
                    pngs[index] = null;
                }
                else
                {
                    pngs[index] = PngFile.Decode(stream, out _);
                }
            }
            else
            {
                metaStreams[index] = stream;
            }
        }

        if (headerStream == null)
        {
            throw new ArchiveCreationException($"Missing {HEADER_FILENAME}.");
        }

        imageMetas = metaStreams.ConvertAll(stream =>
            JsonSerializer.Deserialize<PnaImageMetadata>(stream.Span));

        Header = JsonSerializer.Deserialize<PnaHeader>(headerStream.Span);

        var totalLen = PnaHeader.Size
            + (imageMetas.Count * PnaImageMetadata.Size)
            + Enumerable.Range(0, imageMetas.Count)
                .Sum(i => pngs[i]?.Stream.Length ?? 0);
        Stream = new BinaryStream(totalLen);
        var writer = new BinaryWriter(Stream);
        writer.WriteInt32(SIGNATURE);
        writer.WriteInt32(Header.Unknown04);
        writer.WriteInt32(Header.ImageWidth);
        writer.WriteInt32(Header.ImageHeight);
        writer.WriteInt32(imageMetas.Count);
        int i = 0;
        foreach (var meta in imageMetas)
        {
            writer.WriteInt32(meta.Unknown00);
            writer.WriteInt32(meta.FileId);
            writer.WriteInt32(meta.OffsetX);
            writer.WriteInt32(meta.OffsetY);
            writer.WriteInt32(pngs[i]?.ImageWidth ?? 0);
            writer.WriteInt32(pngs[i]?.ImageHeight ?? 0);
            writer.WriteInt32(meta.Unknown24);
            writer.WriteFloat64(meta.Transparency);
            writer.WriteInt32(pngs[i]?.Stream.Length ?? 0);
            i++;
        }
        foreach (var png in pngs)
        {
            if (png != null)
            {
                writer.WriteBytes(png.Stream.Span);
            }
        }

        Stream.Freeze();
    }

    public static PnaFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PnaFile(stream, out var c), c),
            out confidence);
    }

    public static PnaFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PnaFile(contents));
    }

    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    public List<FileInfo> ListFiles()
    {
        var fileList = imageMetas
            .Select((_, i) => new FileInfo
            {
                Filename = ImageName(i),
                FileSize = imageMetas[i].DataLen,
            });
        var metaList = imageMetas
            .Select((_, i) => new FileInfo
            {
                Filename = MetaName(i),
            });
        return [
            new() { Filename = HEADER_FILENAME },
            .. fileList,
            .. metaList,
        ];
    }

    public Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        filename = filename.ToLowerInvariant();
        if (filename == HEADER_FILENAME)
        {
            var data = JsonSerializer.SerializeToUtf8Bytes(Header);
            return Task.FromResult(new BinaryStream(data));
        }

        var imageIndex = ImageIndex(filename);
        if (imageIndex != null)
        {
            var offset = PnaHeader.Size
                + (imageMetas.Count * PnaImageMetadata.Size)
                + imageMetas
                    .Take(imageIndex.Value)
                    .Sum(meta => meta.DataLen);
            var len = imageMetas[imageIndex.Value].DataLen;
            return Task.FromResult(Stream.SubStream(offset, len));
        }

        var metaIndex = MetaIndex(filename);
        if (metaIndex != null)
        {
            var data = JsonSerializer.SerializeToUtf8Bytes(imageMetas[metaIndex.Value]);
            return Task.FromResult(new BinaryStream(data));
        }

        throw new FileNotFoundException(filename);
    }

    public async Task<PnaFile> AddEntry(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var content = await ((IArchive)this).GetContents(progress, ct);
        var header = Header with { FileCount = Header.FileCount + 1 };
        var meta = new PnaImageMetadata
        {
            Unknown00 = 0,
            FileId = 0,
            OffsetX = 0,
            OffsetY = 0,
            Width = PngFile.Example.ImageHeight,
            Height = PngFile.Example.ImageWidth,
            Unknown24 = 0,
            Transparency = 1.0,
            DataLen = PngFile.Example.Stream.Length,
        };
        var headerJson = JsonSerializer.SerializeToUtf8Bytes(header);
        var metaJson = JsonSerializer.SerializeToUtf8Bytes(meta);
        content[HEADER_FILENAME] = new BinaryStream(headerJson);
        content[MetaName(Header.FileCount)] = new BinaryStream(metaJson);
        content[ImageName(Header.FileCount)] = PngFile.Example.Stream;
        return Create(content);
    }

    public async Task<PnaFile> SwapEntry(
        string filename1,
        string filename2,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        int index1 = ImageIndex(filename1) ?? MetaIndex(filename1) ?? throw new FileNotFoundException(filename1);
        int index2 = ImageIndex(filename2) ?? MetaIndex(filename2) ?? throw new FileNotFoundException(filename2);
        var content = await ((IArchive)this).GetContents(progress, ct);
        if (index1 != index2 || index1 < Header.FileCount)
        {
            var meta1 = MetaName(index1);
            var meta2 = MetaName(index2);
            (content[meta1], content[meta2]) = (content[meta2], content[meta1]);

            var image1 = ImageName(index1);
            var image2 = ImageName(index2);
            (content[image1], content[image2]) = (content[image2], content[image1]);
        }
        return Create(content);
    }

    public static string ImageName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"img{index:D3}.png";
    }

    public static string MetaName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"meta{index:D3}.json";
    }

    public static int? ImageIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("img") && name.EndsWith(".png") && int.TryParse(name[3..^4], out int v))
        {
            return v;
        }
        return null;
    }

    public static int? MetaIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("meta") && name.EndsWith(".json") && int.TryParse(name[4..^5], out int v))
        {
            return v;
        }
        return null;
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

    ~PnaFile()
    {
        Dispose();
    }
}
