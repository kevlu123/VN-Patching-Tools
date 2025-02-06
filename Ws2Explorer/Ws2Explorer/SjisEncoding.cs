using System.Text;

namespace Ws2Explorer;

/// <summary>
/// Provides an instance of the Shift-JIS encoding.
/// </summary>
public static class SjisEncoding
{
    /// <summary>
    /// Gets an instance of the Shift-JIS encoding.
    /// </summary>
    public static Encoding Encoding { get; }

    static SjisEncoding()
    {
        Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        Encoding = Encoding.GetEncoding("shift_jis");
    }
}
