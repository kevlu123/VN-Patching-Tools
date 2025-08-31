using System.Collections.Generic;

namespace Ws2Explorer;

/// <summary>
/// Word wrapping utilities.
/// </summary>
public static class WordWrap
{
    private static int LowerBound(int first, int last, Predicate<int> less)
    {
        // From https://en.cppreference.com/w/cpp/algorithm/lower_bound.html
        int count = last - first;
        while (count > 0)
        {
            int it = first;
            int step = count / 2;
            it += step;

            if (less(it))
            {
                first = ++it;
                count -= step + 1;
            }
            else
            {
                count = step;
            }
        }
        return first;
    }

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
    ///
    /// Single words that are too long to fit in a line will be automatically wrapped by the engine.
    /// This function will NOT insert a newline in this case, though the parameter `lines` will
    /// account for this and have multiple entries for single words that are too long.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="tooLong">A predicate to determine if a line is too long.</param>
    /// <param name="lines">The list of lines.</param>
    /// <returns></returns>
    public static string Wrap(string text, Predicate<string> tooLong, out List<string> lines)
    {
        text = RemoveNewlines(text);
        lines = [];
        string result = "";
        int begin = 0;
        while (begin < text.Length)
        {
            int bound = LowerBound(begin, text.Length, i => !tooLong(text[begin..(i + 1)]));

            int len = bound - begin;
            int spaceLen = 0;

            if (bound != text.Length)
            {
                // Skip partial word at the end
                while (len > 0 && !char.IsWhiteSpace(text[begin + len - 1]))
                {
                    len--;
                }

                // Skip whitespace
                while (len > 0 && char.IsWhiteSpace(text[begin + len - 1]))
                {
                    spaceLen++;
                    len--;
                }
            }

            int oldBegin = begin;
            bool singleWordTooLong = len == 0;
            if (singleWordTooLong)
            {
                len = bound - begin;
                begin = bound;
            }
            else
            {
                begin += len + spaceLen;
            }
            var substr = text[oldBegin..(oldBegin + len)];
            lines.Add(substr);
            result += substr;
            if (!singleWordTooLong)
            {
                result += "\\n";
            }
        }
        return result.EndsWith("\\n") ? result[..^2] : result;
    }

    /// <summary>
    /// Wrap text by a maximum character count.
    ///
    /// Single words that are too long to fit in a line will be automatically wrapped by the engine.
    /// This function will NOT insert a newline in this case, though the parameter `lines` will
    /// account for this and have multiple entries for single words that are too long.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="charCount">The maximum allowed character count for a line.</param>
    /// <param name="lines">The list of lines.</param>
    /// <returns></returns>
    public static string WrapByCharCount(string text, int charCount, out List<string> lines)
    {
        return Wrap(text, s => s.Length > charCount, out lines);
    }

    /// <summary>
    /// Wrap text by a maximum pixel width.
    ///
    /// Single words that are too long to fit in a line will be automatically wrapped by the engine.
    /// This function will NOT insert a newline in this case, though the parameter `lines` will
    /// account for this and have multiple entries for single words that are too long.
    /// </summary>
    /// <param name="text">The text to wrap.</param>
    /// <param name="pixelWidth">The maximum allowed pixel width for a line.</param>
    /// <param name="fontMeasurer">The font to use for measuring text width.</param>
    /// <param name="fontSize">The font size to use for measuring text width.</param>
    /// <param name="fontStyle">The font style to use for measuring text width.</param>
    /// <param name="lines">The list of lines.</param>
    /// <returns></returns>
    public static string WrapByPixelWidth(
        string text,
        float pixelWidth,
        FontMeasurer fontMeasurer,
        int fontSize,
        FontMeasurer.FontStyle fontStyle,
        out List<string> lines)
    {
        return Wrap(
            text,
            s => fontMeasurer.MeasureTextSize(s, fontSize, fontStyle).Width > pixelWidth,
            out lines);
    }
}
