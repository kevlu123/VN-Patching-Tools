using System.Text;

namespace Ws2Explorer;

public sealed class TextFile : IFile<TextFile>
{
    public static readonly (Encoding encoding, int? maxLen)[] PossibleEncodings = [
        (Encoding.UTF8, null),
        (SjisEncoding.Encoding, null),
        (Encoding.Unicode, 1024 * 1024),
    ];

    private bool disposedValue;

    public BinaryStream Stream { get; }

    public string? MetadataSummary => $"Encoding: {Encoding.GetPrettyEncodingName()}";

    public string Text { get; }

    public Encoding Encoding { get; }

    public TextFile(BinaryStream stream, Encoding encoding)
    {
        Text = encoding.GetString(stream.Span);
        Encoding = encoding;
        Stream = stream;
        stream.IncRef();
    }

    private TextFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        foreach (var (encoding, maxLen) in PossibleEncodings)
        {
            try
            {
                if (maxLen.HasValue && stream.Length > maxLen.Value)
                {
                    continue;
                }
                Text = encoding.GetString(stream.Span);
                if (Text.Contains('\0'))
                {
                    continue;
                }
                Encoding = encoding;
                Stream = stream;
                stream.IncRef();
                confidence = DecodeConfidence.Low;
                return;
            }
            catch (DecoderFallbackException) { }
        }
        throw new DecodeException("Unrecognised encoding.");
    }

    public static TextFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new TextFile(stream, out var c), c),
            out confidence);
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

    ~TextFile()
    {
        Dispose();
    }
}

public static class EncodingExtensions
{
    public static string GetPrettyEncodingName(this Encoding encoding)
    {
        if (encoding == SjisEncoding.Encoding)
        {
            return "Shift-JIS";
        }
        else if (encoding is UTF8Encoding)
        {
            return "UTF-8";
        }
        else if (encoding is UnicodeEncoding)
        {
            return "UTF-16";
        }
        else
        {
            return encoding.EncodingName;
        }
    }
}
