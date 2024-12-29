using System.Text;

namespace Ws2Explorer;

public class BinaryFile : IFile {
    public const int MAX_TEXT_SIZE = 1024 * 1024;

    public IFolder? Parent { get; }
    public string Name { get; }
    public BinaryStream Stream { get; protected set; }
    public Encoding? SuggestedEncoding => encoding.Value;
    public bool IsRealFile => Parent is Folder;
    public bool IsText => SuggestedEncoding != null;

    private readonly Lazy<PrettyNameEncoding?> encoding;

    public BinaryFile(IFolder? parent, string name, BinaryStream stream, PrettyNameEncoding? encoding = null) {
        Parent = parent;
        Name = name;
        Stream = stream;
        this.encoding = new Lazy<PrettyNameEncoding?>(encoding == null ? GuessEncoding : () => encoding);
    }

    public static BinaryFile AsText(IFolder? parent, string name, BinaryStream stream) {
        var binaryFile = new BinaryFile(parent, name, stream);
        if (binaryFile.SuggestedEncoding == null) {
            throw new InvalidDataException("The file is not text.");
        }
        return binaryFile;
    }

    public string GetText(Encoding encoding) {
        if (SuggestedEncoding == null && Stream.Length > MAX_TEXT_SIZE) {
            return "";
        }

        var (data, start, len) = Stream.RawBuffer;
        try {
            return encoding.GetString(data, start, len);
        } catch (DecoderFallbackException) {
            return "";
        } catch (ArgumentException) {
            return "";
        }
    }

    private PrettyNameEncoding? GuessEncoding() {
        if (Stream.Length > MAX_TEXT_SIZE) {
            return null;
        }

        var (data, start, len) = Stream.RawBuffer;
        foreach (var encoding in PrettyNameEncoding.Encodings) {
            string text;
            try {
                text = encoding.GetString(data, start, len);
            } catch (DecoderFallbackException) {
                continue;
            } catch (ArgumentException) {
                continue;
            }
            if (text.Contains('\0')) {
                continue;
            }
            return encoding;
        }

        return null;
    }
}
