using System.Text;

namespace Ws2Explorer.Compiler;

public static class SjisEncoding {
    public static Encoding Encoding { get; }

    static SjisEncoding() {
        Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        Encoding = Encoding.GetEncoding("shift_jis");
    }
}