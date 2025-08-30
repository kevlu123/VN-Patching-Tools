using SixLabors.Fonts;
using SLFontStyle = SixLabors.Fonts.FontStyle;

namespace Ws2Explorer;

/// <summary>
/// Font measurement.
/// </summary>
public class FontMeasurer
{
    /// <summary>
    /// Font style.
    /// </summary>
    [Flags]
    public enum FontStyle
    {
        /// <summary>
        /// Regular font style.
        /// </summary>
        Regular = 0,

        /// <summary>
        /// Bold font style.
        /// </summary>
        Bold = 1 << 0,

        /// <summary>
        /// Italic font style.
        /// </summary>
        Italic = 1 << 1,

        /// <summary>
        /// Bold and italic font style.
        /// </summary>
        BoldItalic = Bold | Italic,
    }

    private readonly object fontFamily; // This is a FontFamily but xmldoc2md bugs out when declared as so
    private readonly Dictionary<(int, FontStyle), Font> fonts = [];
    private readonly object fontsMutex = new();

    /// <summary>
    /// Initializes a new instance of the <see cref="FontMeasurer"/> class.
    /// </summary>
    /// <param name="fontData">The font file data in TTF or OTF format.</param>
    public FontMeasurer(ReadOnlySpan<byte> fontData)
    {
        fontFamily = new FontCollection().Add(new MemoryStream(fontData.ToArray()));
    }

    /// <summary>
    /// Measures the pixel width of the specified text.
    /// </summary>
    /// <param name="text">The text to measure.</param>
    /// <param name="fontSize">The font size to use for measuring text width.</param>
    /// <param name="fontStyle">The font style to use for measuring text width.</param>
    /// <returns></returns>
    public (float Width, float Height) MeasureTextSize(
        string text,
        int fontSize,
        FontStyle fontStyle)
    {
        var style = fontStyle switch
        {
            FontStyle.Regular => SLFontStyle.Regular,
            FontStyle.Bold => SLFontStyle.Bold,
            FontStyle.Italic => SLFontStyle.Italic,
            FontStyle.BoldItalic => SLFontStyle.BoldItalic,
            _ => throw new ArgumentOutOfRangeException(nameof(fontStyle), fontStyle, null)
        };
        Font? font;
        lock (fontsMutex)
        {
            if (!fonts.TryGetValue((fontSize, fontStyle), out font))
            {
                font = ((FontFamily)fontFamily).CreateFont(fontSize, style);
                fonts[(fontSize, fontStyle)] = font;
            }
        }

        var rect = TextMeasurer.MeasureSize(text, new TextOptions(font));
        return (rect.Width, rect.Height);
    }
}
