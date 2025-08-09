using SixLabors.ImageSharp.PixelFormats;
using System.Collections.Immutable;
using System.Text.Json.Serialization;
using SixLabors.ImageSharp;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A WIP file header.
/// </summary>
public record WipHeader
{
    internal const int Size = 8;

    /// <summary>
    /// The signature (WIPF).
    /// </summary>
    public required int Signature { get; init; }

    /// <summary>
    /// The number of images in the WIP file.
    /// </summary>
    public required ushort FileCount { get; init; }

    /// <summary>
    /// The bits per pixel for the images in the WIP file.
    /// This can be 8, 24, or 32. If it is 8, a palette of 256 32-bit colours is used.
    /// </summary>
    public required ushort BitsPerPixel { get; init; }

    /// <summary>
    /// Constructs a WIP file header.
    /// </summary>
    /// <param name="signature"></param>
    /// <param name="fileCount"></param>
    /// <param name="bitsPerPixel"></param>
    [JsonConstructor]
    public WipHeader(int signature, ushort fileCount, ushort bitsPerPixel)
        => (Signature, FileCount, BitsPerPixel)
        = (signature, fileCount, bitsPerPixel);

    /// <summary>
    /// Constructs a WIP file header.
    /// </summary>
    public WipHeader() { }
}

/// <summary>
/// Metadata in a WIP file for a single image.
/// </summary>
public record WipImageMetadata
{
    internal const int Size = 24;

    /// <summary>
    /// The width of the image in pixels.
    /// </summary>
    public required int Width { get; init; }

    /// <summary>
    /// The height of the image in pixels.
    /// </summary>
    public required int Height { get; init; }

    /// <summary>
    /// The X offset of this image in the full WIP image.
    /// </summary>
    public required int OffsetX { get; init; }

    /// <summary>
    /// The Y offset of this image in the full WIP image.
    /// </summary>
    public required int OffsetY { get; init; }

    /// <summary>
    /// Unknown.
    /// </summary>
    public required int Unknown10 { get; init; }

    /// <summary>
    /// The length of the compressed image data in bytes.
    /// </summary>
    public required int DataLen { get; init; }

    /// <summary>
    /// Constructs metadata for a single WIP image.
    /// </summary>
    /// <param name="width"></param>
    /// <param name="height"></param>
    /// <param name="offsetX"></param>
    /// <param name="offsetY"></param>
    /// <param name="unknown10"></param>
    /// <param name="dataLen"></param>
    [JsonConstructor]
    public WipImageMetadata(int width, int height, int offsetX, int offsetY, int unknown10, int dataLen)
        => (Width, Height, OffsetX, OffsetY, Unknown10, DataLen)
        = (width, height, offsetX, offsetY, unknown10, dataLen);

    /// <summary>
    /// Constructs metadata for a single WIP image.
    /// </summary>
    public WipImageMetadata() { }
}

/// <summary>
/// A legacy image array file.
/// </summary>
public sealed class WipFile : ImageArchiveFile, IArchive<WipFile>
{
    /// <summary>
    /// WIP file signature as a little-endian 4-byte integer.
    /// </summary>
    public const int SIGNATURE = 0x46504957;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public override BinaryStream Stream { get; }

    /// <summary>
    /// The WIP file header.
    /// </summary>
    public WipHeader Header { get; }

    /// <summary>
    /// The image metadata for each image in the WIP file.
    /// </summary>
    public ImmutableArray<WipImageMetadata> ImageMetadata => [.. imageMetas];
    private readonly List<WipImageMetadata> imageMetas;

    /// <summary>
    /// The number of images in the WIP file including empty images.
    /// </summary>
    public override int ImageCount => Header.FileCount;

    /// <summary>
    /// The width of the space that the WIP image array takes up.
    /// </summary>
    public override int ImageWidth => imageMetas.Count > 0 ? imageMetas.Max(m => m.OffsetX + m.Width) : 0;

    /// <summary>
    /// The height of the space that the WIP image array takes up.
    /// </summary>
    public override int ImageHeight => imageMetas.Count > 0 ? imageMetas.Max(m => m.OffsetY + m.Height) : 0;

    private int PaletteSize => Header.BitsPerPixel == 8 ? 1024 : 0;

    private WipFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        Header = new WipHeader
        {
            Signature = reader.ReadInt32(),
            FileCount = reader.ReadUInt16(),
            BitsPerPixel = reader.ReadUInt16()
        };
        if (Header.Signature != SIGNATURE)
        {
            throw new InvalidDataException("Invalid signature.");
        }

        imageMetas = [];
        for (int i = 0; i < Header.FileCount; i++)
        {
            var meta = new WipImageMetadata
            {
                Width = reader.ReadNonnegativeInt32(),
                Height = reader.ReadNonnegativeInt32(),
                OffsetX = reader.ReadInt32(),
                OffsetY = reader.ReadInt32(),
                Unknown10 = reader.ReadInt32(),
                DataLen = reader.ReadNonnegativeInt32()
            };
            imageMetas.Add(meta);
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    private WipFile(IDictionary<string, BinaryStream> contents)
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
        Header = JsonSerializer.Deserialize<WipHeader>(headerStream.Span)
            ?? throw new ArchiveCreationException("Invalid header.");

        imageMetas = [];
        using var images = new DisposingList<PngFile>();
        var count = Math.Max(
            metaStreams.Count > 0 ? metaStreams.Max(x => x.Index + 1) : 0,
            imageStreams.Count > 0 ? imageStreams.Max(x => x.Index + 1) : 0);
        if (count >= 10000)
        {
            throw new ArchiveCreationException("WIP files with more than 10000 images are not supported.");
        }
        for (int i = 0; i < count; i++)
        {
            if (imageStreams.Count > 0 && imageStreams[^1].Index == i)
            {
                images.Add(PngFile.Decode(imageStreams[^1].Stream, out _));
                imageStreams.RemoveAt(imageStreams.Count - 1);
                if (imageStreams.Count > 0 && imageStreams[^1].Index == i)
                {
                    throw new ArchiveCreationException($"Duplicate image index found: {i}");
                }
            }
            else
            {
                images.Add(PngFile.Example());
            }

            if (metaStreams.Count > 0 && metaStreams[^1].Index == i)
            {
                imageMetas.Add(JsonSerializer.Deserialize<WipImageMetadata>(
                    metaStreams[^1].Stream.Span));
                metaStreams.RemoveAt(metaStreams.Count - 1);
                if (metaStreams.Count > 0 && metaStreams[^1].Index == i)
                {
                    throw new ArchiveCreationException($"Duplicate metadata index found: {i}");
                }
            }
            else
            {
                imageMetas.Add(new WipImageMetadata
                {
                    Width = 0, // Adjusted later
                    Height = 0, // Adjusted later
                    OffsetX = 0,
                    OffsetY = 0,
                    Unknown10 = 0,
                    DataLen = 0, // Adjusted later
                });
            }
        }

        // Encode images
        using var compressed = new DisposingList<BinaryStream>();
        foreach (var image in images)
        {
            compressed.Add(EncodeImage(image, Header.BitsPerPixel));
        }

        // Adjust fields
        for (int i = 0; i < count; i++)
        {
            imageMetas[i] = imageMetas[i] with
            {
                Width = images[i].ImageWidth,
                Height = images[i].ImageHeight,
                DataLen = compressed[i].Length - PaletteSize,
            };
        }
        Header = Header with
        {
            Signature = SIGNATURE,
            FileCount = (ushort)count,
        };

        // Serialise
        using var stream = new BinaryStream(WipHeader.Size
            + (WipImageMetadata.Size * count)
            + compressed.Sum(x => x.Length));
        var writer = new BinaryWriter(stream);
        writer.WriteInt32(Header.Signature);
        writer.WriteUInt16(Header.FileCount);
        writer.WriteUInt16(Header.BitsPerPixel);
        foreach (var meta in imageMetas)
        {
            writer.WriteInt32(meta.Width);
            writer.WriteInt32(meta.Height);
            writer.WriteInt32(meta.OffsetX);
            writer.WriteInt32(meta.OffsetY);
            writer.WriteInt32(meta.Unknown10);
            writer.WriteInt32(meta.DataLen);
        }
        foreach (var image in compressed)
        {
            writer.WriteBytes(image.Span);
        }
        stream.IncRef();
        stream.Freeze();
        Stream = stream;
    }

    /// <summary>
    /// Decodes a WIP file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static WipFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new WipFile(stream, out var c), c),
            out confidence);
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
    public override Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
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
            return Task.FromResult(DecodeImage(imageIndex.Value));
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
    /// Constructs a WIP file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    static WipFile IArchive<WipFile>.Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new WipFile(contents));
    }

    /// <summary>
    /// Constructs a WIP file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public override IArchive Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new WipFile(contents));
    }

    private BinaryStream DecodeImage(int index)
    {
        var reader = new BinaryReader(Stream);
        reader.Skip(WipHeader.Size + (WipImageMetadata.Size * Header.FileCount));
        reader.Skip(ImageMetadata.Take(index).Sum(meta => meta.DataLen + PaletteSize));
        var meta = ImageMetadata[index];
        var palette = new byte[PaletteSize];

        reader.ReadBytes(palette);
        using var imageData = Stream.SubStream(reader.Position, meta.DataLen);
        reader.Skip(meta.DataLen);
        using var decompressed = LZ77.Decompress(imageData);
        var imageReader = new BinaryReader(decompressed);

        using var image = new Image<Rgba32>(meta.Width, meta.Height);
        int planeSize = meta.Width * meta.Height;
        for (int y = 0, n = 0; y < meta.Height; y++)
        {
            for (int x = 0; x < meta.Width; x++, n++)
            {
                byte r, g, b, a;
                if (Header.BitsPerPixel == 8)
                {
                    var i = imageReader.ReadUInt8At(n);
                    r = palette[4 * i];
                    g = palette[(4 * i) + 1];
                    b = palette[(4 * i) + 2];
                    a = 0xFF;
                }
                else
                {
                    b = imageReader.ReadUInt8At(n);
                    g = imageReader.ReadUInt8At(n + planeSize);
                    r = imageReader.ReadUInt8At(n + (2 * planeSize));
                    if (Header.BitsPerPixel == 32)
                    {
                        a = imageReader.ReadUInt8At(n + (3 * planeSize));
                    }
                    else
                    {
                        a = 0xFF;
                    }
                }
                image[x, y] = new Rgba32(r, g, b, a);
            }
        }

        var memory = new MemoryStream();
        image.SaveAsPng(memory);
        return new BinaryStream(memory.ToArray());
    }

    private static BinaryStream EncodeImage(PngFile pngFile, int bpp)
    {
        using var png = Image.Load<Rgba32>(pngFile.Stream.Span);
        var data = new List<byte>();
        var paletteData = new List<byte>();
        if (bpp == 8)
        {
            var palette = new Dictionary<Rgba32, byte>();
            for (int y = 0; y < png.Height; y++)
            {
                for (int x = 0; x < png.Width; x++)
                {
                    var pixel = png[x, y];
                    if (palette.TryGetValue(pixel, out var index))
                    {
                        data.Add(index);
                    }
                    else if (palette.Count >= 256)
                    {
                        throw new InvalidOperationException("Palette overflow: more than 256 colors used in the image.");
                    }
                    else
                    {
                        data.Add((byte)palette.Count);
                        palette[pixel] = (byte)palette.Count;
                    }
                }
            }
            foreach (var colour in palette.OrderBy(kvp => kvp.Value))
            {
                paletteData.Add(colour.Key.R);
                paletteData.Add(colour.Key.G);
                paletteData.Add(colour.Key.B);
                paletteData.Add(0);
            }
            for (int i = palette.Count; i < 256; i++)
            {
                paletteData.Add((byte)i);
                paletteData.Add((byte)i);
                paletteData.Add((byte)i);
                paletteData.Add(0);
            }
        }
        else
        {
            for (int y = 0; y < png.Height; y++)
            {
                for (int x = 0; x < png.Width; x++)
                {
                    data.Add(png[x, y].B);
                }
            }
            for (int y = 0; y < png.Height; y++)
            {
                for (int x = 0; x < png.Width; x++)
                {
                    data.Add(png[x, y].G);
                }
            }
            for (int y = 0; y < png.Height; y++)
            {
                for (int x = 0; x < png.Width; x++)
                {
                    data.Add(png[x, y].R);
                }
            }
            if (bpp == 32)
            {
                for (int y = 0; y < png.Height; y++)
                {
                    for (int x = 0; x < png.Width; x++)
                    {
                        data.Add(png[x, y].A);
                    }
                }
            }
        }

        using var stream = new BinaryStream(data.ToArray());
        return LZ77.Compress(stream, paletteData);
    }
}
