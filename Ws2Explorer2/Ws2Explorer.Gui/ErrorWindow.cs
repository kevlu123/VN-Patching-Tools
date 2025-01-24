namespace Ws2Explorer.Gui;

partial class ErrorWindow : Form
{
    public ErrorWindow(string message)
    {
        InitializeComponent();

        dummy_Label.Text = message;
        message_TextBox.Text = message;

        int padding = message_TextBox.Left;

        message_TextBox.Size = new Size(
            dummy_Label.Width + 30,
            dummy_Label.Height + 30);
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
