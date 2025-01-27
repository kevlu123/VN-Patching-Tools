namespace Ws2Explorer.Gui;

partial class ExtractPatternWindow : Form
{
    public string Pattern { get; private set; } = ".*";

    public ExtractPatternWindow()
    {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        Pattern = pattern_TextBox.Text;
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
