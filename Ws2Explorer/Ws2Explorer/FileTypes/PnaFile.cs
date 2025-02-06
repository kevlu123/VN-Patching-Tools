using System.Collections.Immutable;
using System.Text.Json.Serialization;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A PNA file header.
/// </summary>
public record PnaHeader
{
    internal const int Size = 20;

    /// <summary>
    /// The signature (PNAP).
    /// </summary>
    public required int Signature { get; init; }

    /// <summary>
    /// Unknown.
    /// </summary>
    public required int Unknown04 { get; init; }

    /// <summary>
    /// The width of the space that the PNA image array takes up.
    /// </summary>
    public required int ImageWidth { get; init; }

    /// <summary>
    /// The height of the space that the PNA image array takes up.
    /// </summary>
    public required int ImageHeight { get; init; }

    /// <summary>
    /// The number of images in the PNA image array.
    /// </summary>
    public required int FileCount { get; init; }

    /// <summary>
    /// Constructs a PNA header.
    /// </summary>
    /// <param name="signature"></param>
    /// <param name="unknown04"></param>
    /// <param name="imageWidth"></param>
    /// <param name="imageHeight"></param>
    /// <param name="fileCount"></param>
    [JsonConstructor]
    public PnaHeader(int signature, int unknown04, int imageWidth, int imageHeight, int fileCount)
        => (Signature, Unknown04, ImageWidth, ImageHeight, FileCount)
        = (signature, unknown04, imageWidth, imageHeight, fileCount);

    /// <summary>
    /// Constructs a PNA header.
    /// </summary>
    public PnaHeader() { }
}

/// <summary>
/// PNG image metadata in a PNA file.
/// </summary>
public record PnaImageMetadata
{
    internal const int Size = 40;

    /// <summary>
    /// Unknown.
    /// </summary>
    public required int Unknown00 { get; init; }

    /// <summary>
    /// The 0-based index of the PNG file in the PNA file counted from the end.
    /// If the image is empty (0 bytes), this is -1.
    /// It seems like the engine doesn't really care about this value.
    /// </summary>
    public required int FileId { get; init; }

    /// <summary>
    /// The X offset of this PNG image in the full PNA image space.
    /// </summary>
    public required int OffsetX { get; init; }

    /// <summary>
    /// The Y offset of this PNG image in the full PNA image space.
    /// </summary>
    public required int OffsetY { get; init; }

    /// <summary>
    /// The width of the PNG image.
    /// </summary>
    public required int Width { get; init; }

    /// <summary>
    ///  The height of the PNG image.
    /// </summary>
    public required int Height { get; init; }

    /// <summary>
    /// Unknown.
    /// </summary>
    public required int Unknown24 { get; init; }

    /// <summary>
    /// The transparency of the PNG image between 0 and 1.
    /// It is strange that this is an unaligned 64-bit float.
    /// </summary>
    public required double Transparency { get; init; }

    /// <summary>
    /// The length of the PNG image data in bytes.
    /// </summary>
    public required int DataLen { get; init; }

    /// <summary>
    /// Constructs PNG image metadata.
    /// </summary>
    /// <param name="unknown00"></param>
    /// <param name="fileId"></param>
    /// <param name="offsetX"></param>
    /// <param name="offsetY"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>
    /// <param name="unknown24"></param>
    /// <param name="transparency"></param>
    /// <param name="dataLen"></param>
    [JsonConstructor]
    public PnaImageMetadata(int unknown00, int fileId, int offsetX, int offsetY, int width, int height, int unknown24, double transparency, int dataLen)
        => (Unknown00, FileId, OffsetX, OffsetY, Width, Height, Unknown24, Transparency, DataLen)
        = (unknown00, fileId, offsetX, offsetY, width, height, unknown24, transparency, dataLen);
    
    /// <summary>
    /// Constructs PNG image metadata.
    /// </summary>
    public PnaImageMetadata() { }
}

/// <summary>
/// A PNG array file.
/// </summary>
public sealed class PnaFile : IArchive<PnaFile>
{
    /// <summary>
    /// The PNA file signature (PNAP).
    /// </summary>
    public const int SIGNATURE = 0x50414E50;

    /// <summary>
    /// The header file filename.
    /// </summary>
    public const string HEADER_FILENAME = "header.json";

    /// <summary>
    /// The PNA file header.
    /// </summary>
    public PnaHeader Header { get; }

    /// <summary>
    /// The PNG image metadata.
    /// </summary>
    public ImmutableArray<PnaImageMetadata> ImageMetadata => [.. imageMetas];

    private readonly List<PnaImageMetadata> imageMetas;
    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
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

    /// <summary>
    /// Decodes a PNA file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static PnaFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PnaFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a PNA file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static PnaFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PnaFile(contents));
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
    /// Lists the (possibly virtual) subfiles.
    /// </summary>
    /// <returns></returns>
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

    /// <summary>
    /// Adds a dummy PNG image and metadata to the PNA file,
    /// increasing the file count by 1.
    /// </summary>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new PNA file.</returns>
    public async Task<PnaFile> AddEntry(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var content = await this.LoadAllStreams(progress, ct);
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

    /// <summary>
    /// Swaps the index of two (possibly empty) PNG images and their metadata.
    /// </summary>
    /// <param name="filename1">
    /// The PNG filename or PNG metadata filename of the image to swap.
    /// </param>
    /// <param name="filename2">
    /// The PNG filename or PNG metadata filename of the image to swap.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new PNA file.</returns>
    public async Task<PnaFile> SwapEntry(
        string filename1,
        string filename2,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        int index1 = ImageIndex(filename1) ?? MetaIndex(filename1) ?? throw new FileNotFoundException(filename1);
        int index2 = ImageIndex(filename2) ?? MetaIndex(filename2) ?? throw new FileNotFoundException(filename2);
        return await SwapEntry(index1, index2, progress, ct);
    }

    /// <summary>
    /// Swaps the index of two (possibly empty) PNG images and their metadata.
    /// </summary>
    /// <param name="index1"></param>
    /// <param name="index2"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new PNA file.</returns>
    public async Task<PnaFile> SwapEntry(
        int index1,
        int index2,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var content = await this.LoadAllStreams(progress, ct);
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

    /// <summary>
    /// Gets the PNG filename from the index.
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public static string ImageName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"img{index:D3}.png";
    }

    /// <summary>
    /// Gets the PNG metadata filename from the index.
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public static string MetaName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"meta{index:D3}.json";
    }

    /// <summary>
    /// Gets the index of the PNG file from the filename.
    /// e.g. "img21.png" -> 21
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static int? ImageIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("img") && name.EndsWith(".png") && int.TryParse(name[3..^4], out int v))
        {
            return v;
        }
        return null;
    }

    /// <summary>
    /// Gets the index of the corresponding PNG file from a PNG metadata filename.
    /// e.g. "meta21.json" -> 21
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static int? MetaIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("meta") && name.EndsWith(".json") && int.TryParse(name[4..^5], out int v))
        {
            return v;
        }
        return null;
    }

    /// <summary>
    /// Disposes the PNA file.
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
    /// Disposes the PNA file.
    /// </summary>
    ~PnaFile()
    {
        Dispose();
    }
}
