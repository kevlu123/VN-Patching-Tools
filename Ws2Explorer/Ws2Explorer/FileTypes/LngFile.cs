using System.Collections.ObjectModel;
using System.Text;
using System.Text.Json.Nodes;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A language pack file.
/// </summary>
public sealed class LngFile : IArchive<LngFile>
{
    /// <summary>
    /// The filename of the extracted string data.
    /// </summary>
    public const string STRINGS_FILENAME = "strings.json";

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
    /// The extracted strings.
    /// </summary>
    public ReadOnlyCollection<AffixedString> Strings => strings.AsReadOnly();

    private readonly List<AffixedString> strings = [];
    private readonly string jsonStrings;
    private bool disposedValue;

    private LngFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);
        XorKey = InferXorKey(stream.Span);
        var count = reader.ReadInt32();
        if (count < 0)
        {
            throw new InvalidDataException("Invalid count in LNG file.");
        }
        reader.Skip(2 * count);
        var buffer = new byte[0xFFFF];
        for (int i = 0; i < count; i++)
        {
            var len = reader.ReadUInt16At(4 + (i * 2));
            reader.ReadBytes(new Span<byte>(buffer, 0, len));
            for (int j = 0; j < len; j++)
            {
                buffer[j] ^= XorKey;
            }
            if (len < 2 || buffer[len - 2] != 0 || buffer[len - 1] != 0)
            {
                throw new InvalidDataException("Invalid string.");
            }
            strings.Add(new(Encoding.Unicode.GetString(buffer, 0, len - 2)));
        }
        if (reader.Position != stream.Length)
        {
            throw new InvalidDataException("Trailing data in LNG file.");
        }

        jsonStrings = FormatJsonStrings(strings);

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = count > 0
            ? DecodeConfidence.High
            : DecodeConfidence.Low;
    }

    private LngFile(IDictionary<string, BinaryStream> contents)
    {
        BinaryStream? stringsFile = null;
        BinaryStream? xorKey = null;

        foreach (var (name, stream) in contents)
        {
            if (name == STRINGS_FILENAME)
            {
                stringsFile = stream;
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

        if (stringsFile == null)
        {
            throw new ArchiveCreationException("Strings file not found.");
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

        JsonArray arr = JsonNode.Parse(stringsFile.Span)?.AsArray()
            ?? throw new ArchiveCreationException("Invalid strings file.");
        strings = arr.Select(AffixedString.FromJson!).ToList();
        jsonStrings = FormatJsonStrings(strings);
        Stream = Encode(strings, XorKey);
    }

    private LngFile(IEnumerable<AffixedString> strings, byte xorKey)
    {
        var strs = strings.ToList();
        jsonStrings = FormatJsonStrings(strs);
        Stream = Encode(strs, xorKey);
    }

    /// <summary>
    /// Decodes a LNG file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static LngFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new LngFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a LNG file from subfiles.
    /// Files <see cref="STRINGS_FILENAME"/> and <see cref="XOR_KEY_FILENAME"/> are required.
    /// The XOR key file must contain a single byte in hexadecimal format e.g. "0x1E".
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static LngFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new LngFile(contents));
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
    /// Creates a LNG file from a binary stream and an XOR key.
    /// </summary>
    /// <param name="strings"></param>
    /// <param name="xorKey"></param>
    public static LngFile Create(IEnumerable<AffixedString> strings, byte xorKey)
    {
        return ArchiveCreationException.Wrap(() => new LngFile(strings, xorKey));
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
                Filename = STRINGS_FILENAME,
                FileSize = Encoding.UTF8.GetByteCount(jsonStrings),
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
        return filename.ToLowerInvariant() switch
        {
            STRINGS_FILENAME => Task.FromResult(new BinaryStream(jsonStrings)),
            XOR_KEY_FILENAME => Task.FromResult(new BinaryStream($"0x{XorKey:X2}")),
            _ => throw new FileNotFoundException("File not found.", filename),
        };
    }

    private static string FormatJsonStrings(List<AffixedString> strings)
    {
        return "[\n" + string.Join(
            ",\n",
            strings.Select(s => s.ToJson().ToJsonString(JsonSerializer.Options)))
            + "\n]";
    }

    private static BinaryStream Encode(List<AffixedString> strings, byte xorKey)
    {
        var len = 4
            + (2 * strings.Count)
            + strings.Sum(s => Encoding.Unicode.GetByteCount(s.FullString) + 2);
        var stream = new BinaryStream(len);
        var writer = new BinaryWriter(stream);
        writer.WriteInt32(strings.Count);
        foreach (var str in strings)
        {
            writer.WriteUInt16(checked((ushort)(Encoding.Unicode.GetByteCount(str.FullString) + 2)));
        }
        foreach (var str in strings)
        {
            var bytes = Encoding.Unicode.GetBytes(str.FullString + "\0");
            for (int j = 0; j < bytes.Length; j++)
            {
                bytes[j] ^= xorKey;
            }
            writer.WriteBytes(bytes);
        }
        stream.Freeze();
        return stream;
    }

    private static byte InferXorKey(ReadOnlySpan<byte> data)
    {
        return data[^1];
    }

    /// <summary>
    /// Disposes the LNG file.
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
    /// Disposes the LNG file.
    /// </summary>
    ~LngFile()
    {
        Dispose();
    }
}
