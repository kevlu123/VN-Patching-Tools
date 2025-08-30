using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

namespace Ws2Explorer.Gui;

partial class WordWrapWindow : Form
{
    public class Stats
    {
        public List<string> TextsExceedingMaxLines { get; } = [];
        public int TotalTextsProcessed { get; set; }
    }

    private static bool usePixels = true;
    private static int pixelWidth = 750;
    private static string fontPath = "";
    private static int fontSize = 20;
    private static bool bold = false;
    private static bool italic = false;
    private static int charCount = 24;
    private static bool removeExistingNewlines = true;
    private static int maxLines = 4;

    public Func<string, string>? WordWrapFunction { get; private set; }
    public Stats WordWrapStats { get; } = new();

    public WordWrapWindow()
    {
        InitializeComponent();

        pixels_Radio.Checked = usePixels;
        chars_Radio.Checked = !usePixels;
        pixels_TextBox.Text = pixelWidth.ToString();
        font_TextBox.Text = fontPath;
        fontSize_TextBox.Text = fontSize.ToString();
        bold_CheckBox.Checked = bold;
        italic_CheckBox.Checked = italic;
        chars_TextBox.Text = charCount.ToString();
        removeExistingNewlines_CheckBox.Checked = removeExistingNewlines;
        maxLines_TextBox.Text = maxLines.ToString();

        pixels_GroupBox.Enabled = pixels_Radio.Checked;
        chars_GroupBox.Enabled = chars_Radio.Checked;
    }

    private void FontBrowse_ButtonClicked(object sender, EventArgs e)
    {
        if (PickerDialog.ShowOpenFileDialog("Select font", out var path))
        {
            font_TextBox.Text = path;
        }
    }

    private void Measure_ButtonClicked(object sender, EventArgs e)
    {
        var dialog = new MeasurementWindow();
        dialog.Show();
    }

    private void PixelsChars_RadioCheckChanged(object sender, EventArgs e)
    {
        pixels_GroupBox.Enabled = pixels_Radio.Checked;
        chars_GroupBox.Enabled = chars_Radio.Checked;
    }

    private async void OK_ButtonClicked(object sender, EventArgs e)
    {
        bool removeExistingNewlines = removeExistingNewlines_CheckBox.Checked;

        if (!int.TryParse(maxLines_TextBox.Text, out var maxLines) || maxLines <= 0)
        {
            MessageBox.Show(
                "Invalid maximum line count.",
                "Error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            return;
        }

        void UpdateStats(string text)
        {
            WordWrapStats.TotalTextsProcessed++;
            if (text.Split("\\n").Length > maxLines)
            {
                WordWrapStats.TextsExceedingMaxLines.Add(text);
            }
        }

        if (pixels_Radio.Checked)
        {
            if (!int.TryParse(pixels_TextBox.Text, out var pixelWrapWidth) || pixelWrapWidth <= 0)
            {
                MessageBox.Show(
                    "Invalid max pixel width.",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            if (!int.TryParse(fontSize_TextBox.Text, out var fontSize) || fontSize <= 0)
            {
                MessageBox.Show(
                    "Invalid font size.",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            FontMeasurer fontMeasurer;
            try
            {
                if (font_TextBox.Text.Length == 0)
                {
                    throw new InvalidDataException("No font selected.");
                }
                using var file = await FileTool.ReadFile(font_TextBox.Text)
                    .DecodeWithHint(font_TextBox.Text);
                if (file is not FontFile fontFile)
                {
                    throw new InvalidDataException("Not a font file.");
                }
                fontMeasurer = fontFile.FontMeasurer;
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    $"Failed to load font:\r\n\r\n{ex}",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            WordWrapWindow.pixelWidth = pixelWrapWidth;
            WordWrapWindow.fontPath = font_TextBox.Text;
            WordWrapWindow.fontSize = fontSize;
            WordWrapWindow.bold = bold_CheckBox.Checked;
            WordWrapWindow.italic = italic_CheckBox.Checked;

            WordWrapFunction = text =>
            {
                var newText = WordWrap.WrapByPixelWidth(
                    removeExistingNewlines ? WordWrap.RemoveNewlines(text) : text,
                    pixelWrapWidth,
                    fontMeasurer,
                    fontSize);
                UpdateStats(newText);
                return newText;
            };
        }
        else
        {
            if (!int.TryParse(chars_TextBox.Text, out var charCount) || charCount <= 0)
            {
                MessageBox.Show(
                    "Invalid max character count.",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            WordWrapWindow.charCount = charCount;

            WordWrapFunction = text =>
            {
                var newText = WordWrap.WrapByCharCount(
                    removeExistingNewlines ? WordWrap.RemoveNewlines(text) : text,
                    charCount);
                UpdateStats(newText);
                return newText;
            };
        }

        WordWrapWindow.usePixels = pixels_Radio.Checked;
        WordWrapWindow.removeExistingNewlines = removeExistingNewlines;
        WordWrapWindow.maxLines = maxLines;
        Close();
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        Close();
    }
}
