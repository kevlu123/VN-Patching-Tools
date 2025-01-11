namespace Ws2Explorer.Gui;

partial class NewFileWindow : Form
{
    public string Filename { get; private set; } = string.Empty;

    public NewFileWindow()
    {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
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

        Filename = newName;
        DialogResult = DialogResult.OK;
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
            OK_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }
}
