namespace Ws2Explorer.Gui;

partial class FindReferencesWindow : Form
{
    private static string lastSearchText = string.Empty;
    private static bool lastCaseSensitive;

    public string SearchText { get; private set; } = string.Empty;
    public bool CaseSensitive { get; private set; }

    public FindReferencesWindow()
    {
        InitializeComponent();

        searchText_TextBox.Text = lastSearchText;
        caseSensitive_CheckBox.Checked = lastCaseSensitive;
    }

    private void Find_ButtonClicked(object sender, EventArgs e)
    {
        var text = searchText_TextBox.Text.Trim();
        if (text.Length == 0)
        {
            MessageBox.Show(
                "The search text cannot be empty.",
                "Error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            return;
        }

        SearchText = text;
        SaveSettings();
        DialogResult = DialogResult.OK;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        SaveSettings();
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
            Find_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }

    private void SaveSettings()
    {
        lastSearchText = searchText_TextBox.Text;
        lastCaseSensitive = caseSensitive_CheckBox.Checked;
    }
}
