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
/// Metadata in a PNA file for a single PNG.
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
    /// The width of the PNG image in pixels.
    /// </summary>
    public required int Width { get; init; }

    /// <summary>
    ///  The height of the PNG image in pixels.
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
public sealed class PnaFile : ImageArchiveFile, IArchive<PnaFile>
{
    /// <summary>
    /// The PNA file signature (PNAP).
    /// </summary>
    public const int SIGNATURE = 0x50414E50;

    /// <summary>
    /// The PNA file header.
    /// </summary>
    public PnaHeader Header { get; }

    /// <summary>
    /// The PNG image metadata.
    /// </summary>
    public ImmutableArray<PnaImageMetadata> ImageMetadata => [.. imageMetas];

    private readonly List<PnaImageMetadata> imageMetas;

    /// <summary>
    /// The number of images in the PNA file including empty images.
    /// </summary>
    public override int ImageCount => Header.FileCount;

    /// <summary>
    /// The width of the space that the PNA image array takes up.
    /// </summary>
    public override int ImageWidth => Header.ImageWidth;

    /// <summary>
    /// The height of the space that the PNA image array takes up.
    /// </summary>
    public override int ImageHeight => Header.ImageHeight;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public override BinaryStream Stream { get; }

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
        // Group files into header, metadata, and images.
        var groups = contents.ToLookup(kvp =>
        {
            if (MetaIndex(kvp.Key) != null)
            {
                return "meta";
            }
            else if (ImageIndex(kvp.Key) != null)
            {
                return "image";
            }
            else if (kvp.Key.Equals(HEADER_FILENAME, StringComparison.InvariantCultureIgnoreCase))
            {
                return "header";
            }
            else
            {
                throw new ArchiveCreationException($"Invalid file name '{kvp.Key}'.");
            }
        });

        if (!groups["header"].Any())
        {
            throw new ArchiveCreationException($"Missing {HEADER_FILENAME}.");
        }
        else if (groups["header"].Count() > 1)
        {
            throw new ArchiveCreationException($"Multiple {HEADER_FILENAME}.");
        }

        var headerStream = groups["header"].First().Value;
        var metaStreams = groups["meta"]
            .Select(kvp => new { Index = MetaIndex(kvp.Key)!.Value, Stream = kvp.Value })
            .OrderByDescending(x => x.Index)
            .ToList();
        var imageStreams = groups["image"]
            .Select(kvp => new { Index = ImageIndex(kvp.Key)!.Value, Stream = kvp.Value })
            .OrderByDescending(x => x.Index)
            .ToList();

        // Deserialise
        Header = JsonSerializer.Deserialize<PnaHeader>(headerStream.Span)
            ?? throw new ArchiveCreationException("Invalid header.");

        imageMetas = [];
        using var images = new DisposingList<PngFile?>();
        var count = Math.Max(
            metaStreams.Count > 0 ? metaStreams.Max(x => x.Index + 1) : 0,
            imageStreams.Count > 0 ? imageStreams.Max(x => x.Index + 1) : 0);
        if (count >= 10000)
        {
            throw new ArchiveCreationException("PNA files with more than 10000 images are not supported.");
        }
        for (int i = 0; i < count; i++)
        {
            if (imageStreams.Count > 0 && imageStreams[^1].Index == i)
            {
                if (imageStreams[^1].Stream.Length == 0)
                {
                    images.Add(null);
                }
                else
                {
                    images.Add(PngFile.Decode(imageStreams[^1].Stream, out _));
                }
                imageStreams.RemoveAt(imageStreams.Count - 1);
                if (imageStreams.Count > 0 && imageStreams[^1].Index == i)
                {
                    throw new ArchiveCreationException($"Duplicate image index found: {i}");
                }
            }
            else
            {
                images.Add(null);
            }

            if (metaStreams.Count > 0 && metaStreams[^1].Index == i)
            {
                imageMetas.Add(JsonSerializer.Deserialize<PnaImageMetadata>(
                    metaStreams[^1].Stream.Span));
                metaStreams.RemoveAt(metaStreams.Count - 1);
                if (metaStreams.Count > 0 && metaStreams[^1].Index == i)
                {
                    throw new ArchiveCreationException($"Duplicate metadata index found: {i}");
                }
            }
            else
            {
                imageMetas.Add(new PnaImageMetadata
                {
                    Unknown00 = 0,
                    FileId = 0, // Adjusted later
                    OffsetX = 0,
                    OffsetY = 0,
                    Width = 0, // Adjusted later
                    Height = 0, // Adjusted later
                    Unknown24 = 0,
                    Transparency = 1.0,
                    DataLen = 0, // Adjusted later
                });
            }
        }

        // Adjust fields
        for (int i = 0; i < count; i++)
        {
            var image = images[i];
            imageMetas[i] = imageMetas[i] with
            {
                FileId = image == null ? -1 : count - i - 1,
                Width = image?.ImageWidth ?? 0,
                Height = image?.ImageHeight ?? 0,
                DataLen = image?.Stream.Length ?? 0,
            };
        }
        Header = Header with
        {
            Signature = SIGNATURE,
            FileCount = count,
        };

        // Serialise
        using var stream = new BinaryStream(PnaHeader.Size
            + (PnaImageMetadata.Size * count)
            + images.Sum(img => img?.Stream.Length ?? 0));
        var writer = new BinaryWriter(stream);
        writer.WriteInt32(Header.Signature);
        writer.WriteInt32(Header.Unknown04);
        writer.WriteInt32(Header.ImageWidth);
        writer.WriteInt32(Header.ImageHeight);
        writer.WriteInt32(Header.FileCount);
        foreach (var meta in imageMetas)
        {
            writer.WriteInt32(meta.Unknown00);
            writer.WriteInt32(meta.FileId);
            writer.WriteInt32(meta.OffsetX);
            writer.WriteInt32(meta.OffsetY);
            writer.WriteInt32(meta.Width);
            writer.WriteInt32(meta.Height);
            writer.WriteInt32(meta.Unknown24);
            writer.WriteFloat64(meta.Transparency);
            writer.WriteInt32(meta.DataLen);
        }
        foreach (var image in images)
        {
            if (image != null)
            {
                writer.WriteBytes(image.Stream.Span);
            }
        }
        stream.IncRef();
        stream.Freeze();
        Stream = stream;
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
    static PnaFile IArchive<PnaFile>.Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PnaFile(contents));
    }

    /// <summary>
    /// Constructs a PNA file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public override IArchive Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PnaFile(contents));
    }

    /// <summary>
    /// Lists the (possibly virtual) subfiles.
    /// </summary>
    /// <returns></returns>
    public override List<FileInfo> ListFiles()
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
    public override Task<BinaryStream> OpenFile(
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
}
