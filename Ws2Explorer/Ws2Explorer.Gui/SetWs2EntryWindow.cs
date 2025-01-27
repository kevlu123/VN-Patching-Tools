namespace Ws2Explorer.Gui;

partial class SetWs2EntryWindow : Form
{
    public string EntryPointName { get; private set; }

    public SetWs2EntryWindow(string currentEntryPoint, IEnumerable<string> options)
    {
        InitializeComponent();
        text_ComboBox.Items.AddRange(options.ToArray());
        text_ComboBox.Text = currentEntryPoint;
        EntryPointName = currentEntryPoint;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        EntryPointName = text_ComboBox.Text;
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
