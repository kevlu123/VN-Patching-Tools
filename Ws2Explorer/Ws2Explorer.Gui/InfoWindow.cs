namespace Ws2Explorer.Gui;

partial class InfoWindow : Form
{
    private const int MIN_WIDTH = 100;
    private const int MIN_HEIGHT = 100;
    private const int MAX_WIDTH = 800;
    private const int MAX_HEIGHT = 600;

    private int padding;

    public InfoWindow(string caption, string message)
    {
        InitializeComponent();

        Text = caption;
        dummy_Label.Text = message;
        message_TextBox.Text = message;

        padding = message_TextBox.Left;
        ClientSize = new Size(
            Math.Clamp(dummy_Label.Width + 30, MIN_WIDTH, MAX_WIDTH) + (2 * padding),
            Math.Clamp(dummy_Label.Height + 30, MIN_HEIGHT, MAX_HEIGHT) + (3 * padding) + ok_Button.Height);

        InfoForm_ClientSizeChanged(this, EventArgs.Empty);

        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        Close();
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
    {
        if (keyData == Keys.Enter || keyData == Keys.Escape)
        {
            OK_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }

    private void InfoForm_ClientSizeChanged(object sender, EventArgs e)
    {
        message_TextBox.Size = new Size(
            ClientSize.Width - (2 * padding),
            ClientSize.Height - (3 * padding) - ok_Button.Height);
    }
}
