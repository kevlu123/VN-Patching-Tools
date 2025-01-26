/*
PTF Compression Format

4 bytes:        length of the decompressed data, uint32 little-endian
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
...

While output is written, a circular buffer of 4096 bytes keeps
track of the output history.

After all output has been written, the output is XORed with an
externally provided value. This value can be easily inferred
by looking at the first few bytes of the output.

Format bits is an array of 8 bits corresponding to the mode
of 8 'blocks' of data that follow. This bit array is read
starting from the least significant bit.

If the format bit is 1, the next byte is a single byte of data.

If the format bit is 0, the next two bytes encode a reference
to a sequence of data in the history buffer.
Denote the two bytes by 0bAAAABBBB 0bCCCCDDDD.
The index of the sequence in the history buffer is 0bBBBBCCCC.
The length of the sequence is 0b0000DDDD+2 bytes.
This sequence may wrap around the end of the history buffer.
If the index is 0, the end of the data is reached and the
reference is not used.
 */

using System.Text;

namespace Ws2Explorer;

public enum FontType
{
    TTF,
    OTF,
}

public sealed class PtfFile : IArchive<PtfFile>
{
    public const string FONT_FILENAME = "font";
    public const string XOR_KEY_FILENAME = "xor_key.txt";

    public BinaryStream Stream { get; }

    public byte XorKey { get; }

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
        this.decompressed = decompressed.Clone();
        this.decompressed.Freeze();
    }

    public static PtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PtfFile(stream, out var c), c),
            out confidence);
    }

    public static PtfFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new PtfFile(contents));
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

    public static byte? InferXorKey(ReadOnlySpan<byte> data, out FontType fontType)
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

    public static BinaryStream Decompress(BinaryStream stream, out byte xorKey, out FontType fontType)
    {
        var reader = new BinaryReader(stream);
        var outputLen = reader.ReadInt32();
        var outputBuffer = new byte[outputLen];
        var outputIndex = 0;

        var history = new byte[0x1000];
        var historyWriteIndex = 1;

        byte? key = null;
        FontType ft = default;

        void CheckXorKey()
        {
            if (!key.HasValue && outputIndex >= 4)
            {
                key = InferXorKey(outputBuffer, out ft);
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
                    outputBuffer[outputIndex++] = input;
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
                        outputBuffer[outputIndex++] = input;
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
        CheckXorKey();
        if (!key.HasValue)
        {
            throw new InvalidDataException("Data is too short.");
        }
        else if (outputIndex < outputLen)
        {
            throw new InvalidDataException("Output length field does not match actual output length.");
        }
        fontType = ft;
        xorKey = key.Value;
        for (int j = 0; j < outputBuffer.Length; j++)
        {
            outputBuffer[j] ^= xorKey;
        }

        return new BinaryStream(outputBuffer);
    }

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

    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    ~PtfFile()
    {
        Dispose();
    }
}
