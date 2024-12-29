using Microsoft.WindowsAPICodePack.Dialogs;

namespace Ws2Explorer.Gui;

partial class ExternalEditorPathWindow : Form {
    private readonly CommonOpenFileDialog browseDialog;

    public string TextEditorPath { get; private set; } = "";
    public string TextEditorArgs { get; private set; } = "";
    public string ImageEditorPath { get; private set; } = "";
    public string ImageEditorArgs { get; private set; } = "";
    public string HexEditorPath { get; private set; } = "";
    public string HexEditorArgs { get; private set; } = "";

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
        textEditorArgsTextBox.Text = config.TextEditorArgs;
        imageEditorPathTextBox.Text = config.ImageEditorPath;
        imageEditorArgsTextBox.Text = config.ImageEditorArgs;
        hexEditorPathTextBox.Text = config.HexEditorPath;
        hexEditorArgsTextBox.Text = config.HexEditorArgs;
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
        TextEditorArgs = textEditorArgsTextBox.Text;
        ImageEditorPath = imageEditorPathTextBox.Text;
        ImageEditorArgs = imageEditorArgsTextBox.Text;
        HexEditorPath = hexEditorPathTextBox.Text;
        HexEditorArgs = hexEditorArgsTextBox.Text;
        DialogResult = DialogResult.OK;
    }

    private void CancelButtonClicked(object sender, EventArgs e) {
        DialogResult = DialogResult.Cancel;
    }
}
