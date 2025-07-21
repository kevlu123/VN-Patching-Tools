using System.Runtime.InteropServices;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// Font type.
/// </summary>
public enum FontType
{
    /// <summary>
    /// True type font.
    /// </summary>
    TTF,

    /// <summary>
    /// Open type font.
    /// </summary>
    OTF,
}

/// <summary>
/// A compressed font file.
/// </summary>
public sealed class PtfFile : IArchive<PtfFile>
{
    /// <summary>
    /// The filename of the decompressed font file.
    /// </summary>
    public const string FONT_FILENAME = "font";

    /// <summary>
    /// The filename of the XOR key file.
    /// </summary>
    public const string XOR_KEY_FILENAME = "xor_key.txt";

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The XOR key used to obfuscate the data.
    /// This key is specific to different games but
    /// can be easily inferred.
    /// </summary>
    public byte XorKey { get; }

    /// <summary>
    /// The type of font file.
    /// </summary>
    public FontType FontType { get; }

    private readonly BinaryStream decompressed;
    private bool disposedValue;

    private PtfFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        decompressed = Decompress(stream, out var xorKey, out var fontType);
        XorKey = xorKey;
        FontType = fontType;

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    private PtfFile(IDictionary<string, BinaryStream> contents)
    {
        BinaryStream? decompressed = null;
        BinaryStream? xorKey = null;

        foreach (var (name, stream) in contents)
        {
            if (name == FONT_FILENAME ||
                name == $"{FONT_FILENAME}.ttf" ||
                name == $"{FONT_FILENAME}.otf")
            {
                if (decompressed != null)
                {
                    throw new ArchiveCreationException("Multiple font files found.");
                }
                decompressed = stream;
            }
            else if (name == XOR_KEY_FILENAME)
            {
                xorKey = stream;
            }
            else
            {
                throw new ArchiveCreationException($"Invalid file '{name}'.");
            }
        }

        if (decompressed == null)
        {
            throw new ArchiveCreationException("Font file not found.");
        }
        if (xorKey == null)
        {
            throw new ArchiveCreationException("XOR key file not found.");
        }

        if (xorKey.Span.Length != 4 || xorKey.Span[0] != '0' || xorKey.Span[1] != 'x')
        {
            throw new ArchiveCreationException("Invalid XOR key file.");
        }
        XorKey = byte.Parse(xorKey.Span[2..], System.Globalization.NumberStyles.AllowHexSpecifier);
        using var compressed = Compress(decompressed, XorKey);
        FontType = GetFontType(decompressed.Span) ?? throw new ArchiveCreationException("Font type not recognized.");
        Stream = compressed;
        compressed.Freeze();
        compressed.IncRef();
        this.decompressed = decompressed;
        decompressed.IncRef();
    }

    /// <summary>
    /// Decodes a PTF file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static PtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PtfFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a PTF file from subfiles.
    /// Files <see cref="FONT_FILENAME"/> and <see cref="XOR_KEY_FILENAME"/> are required.
    /// The font file may have the extension ".ttf" or ".otf".
    /// The XOR key file must contain a single byte in hexadecimal format e.g. "0x1E".
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static PtfFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PtfFile(contents));
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
                Filename = FONT_FILENAME + (FontType == FontType.OTF ? ".otf" : ".ttf"),
                FileSize = decompressed.Length,
            },
            new FileInfo
            {
                Filename = XOR_KEY_FILENAME,
                FileSize = $"0x{XorKey:X2}".Length,
            },
        ];
    }

    /// <summary>
    /// Opens a virtual subfile.
    /// The filename is case-insensitive.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        switch (filename.ToLowerInvariant())
        {
            case FONT_FILENAME:
            case $"{FONT_FILENAME}.ttf":
            case $"{FONT_FILENAME}.otf":
                decompressed.IncRef();
                return Task.FromResult(decompressed);
            case XOR_KEY_FILENAME:
                return Task.FromResult(new BinaryStream($"0x{XorKey:X2}"));
            default:
                throw new FileNotFoundException("File not found.", filename);
        }
    }

    /// <summary>
    /// Gets the font type from the font file data.
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public static FontType? GetFontType(ReadOnlySpan<byte> data)
    {
        if (data.Length >= 4)
        {
            // OTF file (signature 0x4F 0x54 0x54 0x4F)
            if (data[0] == data[3] && data[1] == data[2])
            {
                return FontType.OTF;
            }

            // TTF file (signature 0x00 0x01 0x00 0x00)
            if (data[0] == data[2] && data[2] == data[3])
            {
                return FontType.TTF;
            }
        }
        return null;
    }

    private static byte? InferXorKey(ReadOnlySpan<byte> data, out FontType fontType)
    {
        var ft = GetFontType(data);
        if (ft == null)
        {
            fontType = default;
            return null;
        }

        fontType = ft.Value;
        if (fontType == FontType.OTF)
        {
            return (byte)(data[0] ^ 0x4F);
        }
        return data[0];
    }

    /// <summary>
    /// Decompresses a PTF file.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="xorKey">The inferred XOR key used to obfuscate the data.</param>
    /// <param name="fontType"></param>
    /// <returns></returns>
    public static BinaryStream Decompress(BinaryStream stream, out byte xorKey, out FontType fontType)
    {
        var reader = new BinaryReader(stream);
        var outputLen = reader.ReadInt32();
        if (outputLen <= 4)
        {
            throw new InvalidDataException("Decompressed data too short");
        }
        var outputBuffer = new List<byte>();

        var history = new byte[0x1000];
        var historyWriteIndex = 1;

        byte? key = null;
        FontType ft = default;

        void CheckXorKey()
        {
            if (!key.HasValue && outputBuffer.Count >= 4)
            {
                key = InferXorKey(CollectionsMarshal.AsSpan(outputBuffer), out ft);
                if (!key.HasValue)
                {
                    throw new InvalidDataException("Invalid signature. Decompressed data is neither TTF nor OTF format.");
                }
            }
        }

        while (true)
        {
            var formatBits = reader.ReadUInt8();
            for (int i = 0; i < 8; i++, formatBits >>= 1)
            {
                if ((formatBits & 1) == 1)
                {
                    var input = reader.ReadUInt8();
                    outputBuffer.Add(input);
                    history[historyWriteIndex] = input;
                    historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                }
                else
                {
                    var b1 = reader.ReadUInt8();
                    var b2 = reader.ReadUInt8();
                    var historyReadIndex = (b1 << 4) | (b2 >> 4);
                    if (historyReadIndex == 0)
                    {
                        goto end;
                    }

                    var length = (b2 & 0xF) + 2;
                    for (int j = 0; j < length; j++)
                    {
                        var input = history[historyReadIndex];
                        outputBuffer.Add(input);
                        history[historyWriteIndex] = input;
                        historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                        historyReadIndex = (historyReadIndex + 1) & 0xFFF;
                    }
                }
            }

            // If key is invalid, quick fail
            CheckXorKey();
        }

    end:
        if (reader.Length != reader.Position)
        {
            throw new InvalidDataException("Length mismatch.");
        }
        CheckXorKey();
        if (!key.HasValue)
        {
            throw new InvalidDataException("Data is too short.");
        }
        else if (outputBuffer.Count < outputLen)
        {
            throw new InvalidDataException("Output length field does not match actual output length.");
        }
        fontType = ft;
        xorKey = key.Value;
        for (int j = 0; j < outputBuffer.Count; j++)
        {
            outputBuffer[j] ^= xorKey;
        }

        return new BinaryStream(outputBuffer.ToArray());
    }

    /// <summary>
    /// Compresses to a PTF file.
    /// </summary>
    /// <param name="data"></param>
    /// <param name="xorKey">The XOR key to obfuscate the data.</param>
    /// <returns></returns>
    public static BinaryStream Compress(BinaryStream data, byte xorKey)
    {
        var reader = new BinaryReader(data);
        var input = new byte[data.Length];
        for (int i = 0; i < data.Length; i++)
        {
            input[i] = (byte)(reader.ReadUInt8() ^ xorKey);
        }

        var output = new List<byte>();
        output.AddRange(BitConverter.GetBytes(input.Length));

        var inputIndex = 0;

        var formatBits = new List<byte>();
        var blockData = new List<byte>();

        bool exit = false;
        while (!exit)
        {
            formatBits.Clear();
            blockData.Clear();

            for (int i = 0; i < 8; i++)
            {
                if (inputIndex >= input.Length)
                {
                    exit = true;
                    formatBits.Add(0);
                    blockData.Add(0);
                    blockData.Add(0);
                    break;
                }
                formatBits.Add(1);
                blockData.Add(input[inputIndex++]);
            }

            while (formatBits.Count < 8)
            {
                formatBits.Add(0);
            }

            var format = formatBits[0]
                | (formatBits[1] << 1)
                | (formatBits[2] << 2)
                | (formatBits[3] << 3)
                | (formatBits[4] << 4)
                | (formatBits[5] << 5)
                | (formatBits[6] << 6)
                | (formatBits[7] << 7);
            output.Add((byte)format);
            output.AddRange(blockData);
        }

        return new BinaryStream([.. output]);
    }

    /// <summary>
    /// Disposes the PTF file.
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
    /// Disposes the PTF file.
    /// </summary>
    ~PtfFile()
    {
        Dispose();
    }
}
