namespace Ws2Explorer.Gui;

partial class RenameWindow : Form {
    public string? NewName { get; private set; }

    public RenameWindow(string oldName) {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterParent;
        filenameTextBox.Text = oldName;
    }

    private void RenameButtonClicked(object sender, EventArgs e) {
        var newName = filenameTextBox.Text.Trim();
        if (newName.Length == 0) {
            MainWindow.ShowErrorMessageBox("The new name cannot be empty.");
            return;
        }

        NewName = newName;
        DialogResult = DialogResult.OK;
    }

    private void CancelButtonClicked(object sender, EventArgs e) {
        DialogResult = DialogResult.Cancel;
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData) {
        if (keyData == Keys.Escape) {
            CancelButtonClicked(this, EventArgs.Empty);
            return true;
        }

        if (keyData == Keys.Enter) {
            RenameButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }
}
