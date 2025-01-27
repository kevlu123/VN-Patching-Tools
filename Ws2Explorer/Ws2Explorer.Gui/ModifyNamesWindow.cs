namespace Ws2Explorer.Gui;

partial class ModifyNamesWindow : Form
{
    private readonly List<string> names;

    public Dictionary<string, string> NameMapping { get; private set; } = [];

    public ModifyNamesWindow(IEnumerable<string> names)
    {
        InitializeComponent();

        this.names = names.ToList();
        foreach (var name in this.names)
        {
            names_DataGridView.Rows.Add(name, name);
        }
        ModifyNamesForm_ClientSizeChanged(this, EventArgs.Empty);

        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        foreach (DataGridViewRow row in names_DataGridView.Rows)
        {
            NameMapping[(string)row.Cells[0].Value] = (string)row.Cells[1].Value;
        }
        DialogResult = DialogResult.OK;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        DialogResult = DialogResult.Cancel;
    }

    private void ModifyNamesForm_ClientSizeChanged(object sender, EventArgs e)
    {
        names_DataGridView.Size = new Size(
            ClientSize.Width - 20,
            ClientSize.Height - ok_Button.Height - 30);
        names_DataGridView.Columns[0].Width = names_DataGridView.Width / 2;
        names_DataGridView.Columns[1].Width = names_DataGridView.Width / 2;
    }
}
