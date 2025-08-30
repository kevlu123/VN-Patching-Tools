namespace Ws2Explorer;

/// <summary>
/// Word wrapping utilities.
/// </summary>
public static class WordWrap
{
    /// <summary>
    /// Remove all variations of newlines from a string.
    /// 
    /// This removes "\r\n", "\n", "\r", and "\\n".
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string RemoveNewlines(string str)
    {
        return str
            .Replace("\r\n", " ")
            .Replace("\n", " ")
            .Replace("\r", " ")
            .Replace("\\n", " ");
    }

    /// <summary>
    /// Wrap text given a predicate.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="tooLong">A predicate to determine if a line is too long.</param>
    /// <param name="newline">The string to use for the inserted newlines.</param>
    /// <returns></returns>
    public static string Wrap(string text, Predicate<string> tooLong, string newline = "\\n")
    {
        bool containsLongNewline = text.Contains("\\n");
        if (containsLongNewline)
        {
            text = text.Replace("\\n", "\n");
        }

        var lines = new List<string>();
        int begin = 0;
        int len = 2;
        int? lastGoodLen = null;
        int spaceLen = 0;

        // TODO: use binary search
        while (begin + len < text.Length)
        {
            if (tooLong(text[begin..(begin + len)]))
            {
                lastGoodLen ??= len - 1;
                lines.Add(text[begin..(begin + lastGoodLen.Value)]);
                begin += lastGoodLen.Value + spaceLen;
                len = 1;
                lastGoodLen = null;
                len++;
                spaceLen = 0;
            }
            else if (char.IsWhiteSpace(text[begin + len]))
            {
                lastGoodLen = len;
                spaceLen = 1;
                len++;
                while (begin + len < text.Length && char.IsWhiteSpace(text[begin + len]))
                {
                    len++;
                    spaceLen++;
                }
            }
            else
            {
                len++;
            }
        }
        if (begin < text.Length)
        {
            lines.Add(text[begin..]);
        }
        var s = string.Join(newline, lines);
        if (containsLongNewline)
        {
            return s.Replace("\n", "\\n");
        }
        return s;
    }

    /// <summary>
    /// Wrap text by a maximum character count.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="charCount">The maximum allowed character count for a line.</param>
    /// <param name="newline">The string to use for the inserted newlines.</param>
    /// <returns></returns>
    public static string WrapByCharCount(string text, int charCount, string newline = "\\n")
    {
        return Wrap(text, s => s.Length > charCount, newline);
    }

    /// <summary>
    /// Wrap text by a maximum pixel width.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="pixelWidth">The maximum allowed pixel width for a line.</param>
    /// <param name="fontMeasurer">The font to use for measuring text width.</param>
    /// <param name="fontSize">The font size to use for measuring text width.</param>
    /// <param name="fontStyle">The font style to use for measuring text width.</param>
    /// <param name="newline">The string to use for the inserted newlines.</param>
    /// <returns></returns>
    public static string WrapByPixelWidth(
        string text,
        float pixelWidth,
        FontMeasurer fontMeasurer,
        int fontSize,
        FontMeasurer.FontStyle fontStyle = FontMeasurer.FontStyle.Regular,
        string newline = "\\n")
    {
        return Wrap(
            text,
            s => fontMeasurer.MeasureTextSize(s, fontSize, fontStyle).Width > pixelWidth,
            newline);
    }
}
