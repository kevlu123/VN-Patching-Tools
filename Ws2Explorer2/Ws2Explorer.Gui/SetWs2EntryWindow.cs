namespace Ws2Explorer.Gui;

partial class SetWs2EntryWindow : Form
{
    public string EntryPointName { get; private set; }

    public SetWs2EntryWindow(string currentEntryPoint, string[] options)
    {
        InitializeComponent();
        text_ComboBox.Items.AddRange(options);
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
}
