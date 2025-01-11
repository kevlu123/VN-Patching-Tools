using Microsoft.WindowsAPICodePack.Dialogs;

namespace Ws2Explorer.Gui;

partial class SetEditorsWindow : Form
{
    private readonly CommonOpenFileDialog browse_FileDialog;

    public EditorSettings EditorSettings { get; private set; }

    public SetEditorsWindow(EditorSettings settings)
    {
        InitializeComponent();

        StartPosition = FormStartPosition.CenterParent;

        browse_FileDialog = new CommonOpenFileDialog()
        {
            EnsurePathExists = true,
            EnsureFileExists = true,
            Multiselect = false,
            IsFolderPicker = false,
            Title = "Select executable",
        };

        textEditorPath_TextBox.Text = settings.TextEditorPath;
        textEditorArgs_TextBox.Text = settings.TextEditorArgs;
        imageEditorPath_TextBox.Text = settings.ImageEditorPath;
        imageEditorArgs_TextBox.Text = settings.ImageEditorArgs;
        hexEditorPath_TextBox.Text = settings.HexEditorPath;
        hexEditorArgs_TextBox.Text = settings.HexEditorArgs;

        EditorSettings = settings;
    }

    private void TextEditorBrowse_ButtonClicked(object sender, EventArgs e)
    {
        if (browse_FileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            textEditorPath_TextBox.Text = browse_FileDialog.FileName;
        }
    }

    private void ImageEditorBrowse_ButtonClicked(object sender, EventArgs e)
    {
        if (browse_FileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            imageEditorPath_TextBox.Text = browse_FileDialog.FileName;
        }
    }

    private void HexEditorBrowse_ButtonClicked(object sender, EventArgs e)
    {
        if (browse_FileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            hexEditorPath_TextBox.Text = browse_FileDialog.FileName;
        }
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        EditorSettings = new EditorSettings()
        {
            TextEditorPath = textEditorPath_TextBox.Text,
            TextEditorArgs = textEditorArgs_TextBox.Text,
            ImageEditorPath = imageEditorPath_TextBox.Text,
            ImageEditorArgs = imageEditorArgs_TextBox.Text,
            HexEditorPath = hexEditorPath_TextBox.Text,
            HexEditorArgs = hexEditorArgs_TextBox.Text,
        };
        DialogResult = DialogResult.OK;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        DialogResult = DialogResult.Cancel;
    }
}
