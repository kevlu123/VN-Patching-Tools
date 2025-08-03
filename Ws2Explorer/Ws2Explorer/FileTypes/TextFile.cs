using System.Text;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A text file.
/// </summary>
public sealed class TextFile : IFile<TextFile>
{
    private static readonly (Encoding encoding, int? maxLen)[] PossibleEncodings = [
        (Encoding.UTF8, null),
        (SjisEncoding.Encoding, null),
        (Encoding.Unicode, 1024 * 1024),
    ];

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The text of the file.
    /// </summary>
    public string Text { get; }

    /// <summary>
    /// The encoding of the file.
    /// </summary>
    public Encoding Encoding { get; }

    /// <summary>
    /// Constructs a text file from a UTF-8 string.
    /// </summary>
    /// <param name="text"></param>
    public TextFile(string text) : this(new BinaryStream(text), Encoding.UTF8)
    {
    }

    /// <summary>
    /// Constructs a text file from a binary stream and an encoding.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="encoding"></param>
    public TextFile(BinaryStream stream, Encoding encoding)
    {
        Text = encoding.GetString(stream.Span);
        Encoding = encoding;
        Stream = stream;
        stream.Freeze();
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
                stream.Freeze();
                stream.IncRef();
                confidence = encoding == Encoding.UTF8 ? DecodeConfidence.High : DecodeConfidence.Low;
                return;
            }
            catch (DecoderFallbackException) { }
        }
        throw new DecodeException("Unrecognised encoding.");
    }

    /// <summary>
    /// Decodes a text file from a binary stream.
    /// If this succeeds, the confidence is always low.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static TextFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new TextFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Disposes the text file.
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
    /// Disposes the text file.
    /// </summary>
    ~TextFile()
    {
        Dispose();
    }
}

/// <summary>
/// Extensions for the <see cref="Encoding"/> class.
/// </summary>
public static class EncodingExtensions
{
    /// <summary>
    /// Gets a pretty name for the encoding.
    /// </summary>
    /// <param name="encoding"></param>
    /// <returns></returns>
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
