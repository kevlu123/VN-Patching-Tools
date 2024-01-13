using Microsoft.WindowsAPICodePack.Dialogs;

namespace Ws2Explorer.Gui;

partial class ExternalEditorPathWindow : Form {
    private readonly CommonOpenFileDialog browseDialog;

    public string TextEditorPath { get; private set; } = "";
    public string ImageEditorPath { get; private set; } = "";
    public string HexEditorPath { get; private set; } = "";

    public ExternalEditorPathWindow(Config config) {
        InitializeComponent();

        StartPosition = FormStartPosition.CenterParent;

        browseDialog = new CommonOpenFileDialog() {
            EnsurePathExists = true,
            EnsureFileExists = true,
            Multiselect = false,
            IsFolderPicker = false,
            Title = "Select executable",
        };

        textEditorPathTextBox.Text = config.TextEditorPath;
        imageEditorPathTextBox.Text = config.ImageEditorPath;
        hexEditorPathTextBox.Text = config.HexEditorPath;
    }

    private void BrowsePath(object sender, EventArgs e) {
        TextBox textBox;
        if (sender == textEditorPathBrowseButton) {
            textBox = textEditorPathTextBox;
        } else if (sender == imageEditorPathBrowseButton) {
            textBox = imageEditorPathTextBox;
        } else if (sender == hexEditorPathBrowseButton) {
            textBox = hexEditorPathTextBox;
        } else {
            return;
        }

        if (browseDialog.ShowDialog() == CommonFileDialogResult.Ok) {
            textBox.Text = browseDialog.FileName;
        }
    }

    private void OkButtonClicked(object sender, EventArgs e) {
        TextEditorPath = textEditorPathTextBox.Text;
        ImageEditorPath = imageEditorPathTextBox.Text;
        HexEditorPath = hexEditorPathTextBox.Text;
        DialogResult = DialogResult.OK;
    }

    private void CancelButtonClicked(object sender, EventArgs e) {
        DialogResult = DialogResult.Cancel;
    }
}
