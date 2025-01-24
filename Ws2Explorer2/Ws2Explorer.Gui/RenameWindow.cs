namespace Ws2Explorer.Gui;

partial class RenameWindow : Form
{
    public string Filename { get; private set; }

    public RenameWindow(string oldName)
    {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterParent;
        Filename = oldName;
        filename_TextBox.Text = oldName;
    }

    private void Rename_ButtonClicked(object sender, EventArgs e)
    {
        var newName = filename_TextBox.Text.Trim();
        if (newName.Length == 0)
        {
            MessageBox.Show(
                "The new name cannot be empty.",
                "Error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            return;
        }

        DialogResult = Filename == newName
            ? DialogResult.Cancel
            : DialogResult.OK;
        Filename = newName;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        DialogResult = DialogResult.Cancel;
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
    {
        if (keyData == Keys.Escape)
        {
            Cancel_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        if (keyData == Keys.Enter)
        {
            Rename_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }
}
