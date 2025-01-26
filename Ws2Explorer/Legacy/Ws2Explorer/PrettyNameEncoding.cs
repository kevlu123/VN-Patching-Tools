using System.Diagnostics.CodeAnalysis;
using System.Text;
using Ws2Explorer.Compiler;

namespace Ws2Explorer;

public class PrettyNameEncoding : Encoding {
    public static new PrettyNameEncoding UTF8 { get; }
    public static PrettyNameEncoding UTF16 { get; }
    public static PrettyNameEncoding Sjis { get; }
    public static PrettyNameEncoding[] Encodings { get; }

    static PrettyNameEncoding() {
        UTF8 = new PrettyNameEncoding(Encoding.UTF8, "UTF-8");
        UTF16 = new PrettyNameEncoding(Encoding.Unicode, "UTF-16");
        Sjis = new PrettyNameEncoding(SjisEncoding.Encoding, "Shift-JIS");

        Encodings = new PrettyNameEncoding[] {
            UTF8,
            UTF16,
            Sjis,
        };
    }

    private readonly Encoding encoding;
    private readonly string name;

    public PrettyNameEncoding(Encoding encoding, string name) {
        this.encoding = encoding;
        this.name = name;
    }

    public override string ToString() {
        return name;
    }

    public override bool Equals([NotNullWhen(true)] object? value) {
        if (value is PrettyNameEncoding other) {
            return encoding.Equals(other.encoding);
        }
        return false;
    }

    public override int GetHashCode() {
        return encoding.GetHashCode();
    }

    public override int GetByteCount(char[] chars, int index, int count) {
        return encoding.GetByteCount(chars, index, count);
    }

    public override int GetBytes(char[] chars, int charIndex, int charCount, byte[] bytes, int byteIndex) {
        return encoding.GetBytes(chars, charIndex, charCount, bytes, byteIndex);
    }

    public override int GetCharCount(byte[] bytes, int index, int count) {
        return encoding.GetCharCount(bytes, index, count);
    }

    public override int GetChars(byte[] bytes, int byteIndex, int byteCount, char[] chars, int charIndex) {
        return encoding.GetChars(bytes, byteIndex, byteCount, chars, charIndex);
    }

    public override int GetMaxByteCount(int charCount) {
        return encoding.GetMaxByteCount(charCount);
    }

    public override int GetMaxCharCount(int byteCount) {
        return encoding.GetMaxCharCount(byteCount);
    }
}
