namespace Ws2Explorer.Gui;

partial class InfoWindow : Form
{
    private const int MAX_WIDTH = 800;
    private const int MAX_HEIGHT = 600;

    public InfoWindow(string caption, string message)
    {
        InitializeComponent();

        Text = caption;
        dummy_Label.Text = message;
        message_TextBox.Text = message;

        int padding = message_TextBox.Left;

        message_TextBox.Size = new Size(
            Math.Min(dummy_Label.Width + 30, MAX_WIDTH),
            Math.Min(dummy_Label.Height + 30, MAX_HEIGHT));
        ClientSize = new Size(
            message_TextBox.Width + (2 * padding),
            message_TextBox.Height + (3 * padding) + ok_Button.Height);

        ok_Button.Location = new Point(
            message_TextBox.Right - ok_Button.Width,
            message_TextBox.Bottom + padding);

        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        Close();
    }
}
