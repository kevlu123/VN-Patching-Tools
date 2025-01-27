using Ws2Explorer.HighLevel;

namespace Ws2Explorer.Gui;

public partial class OverwriteWindow : Form
{
    public OverwriteMode? OverwriteMode { get; private set; }

    public OverwriteWindow(IEnumerable<string> existing)
    {
        InitializeComponent();

        message_Label.Text = $"Overwrite existing files?\n\n{string.Join("\n", existing)}";
        int y = message_Label.Bottom + 10;
        SetControlY(overwrite_Button, y);
        SetControlY(rename_Button, y);
        SetControlY(skip_Button, y);
        SetControlY(cancel_Button, y);
        ClientSize = new Size(
            ClientSize.Width,
            cancel_Button.Bottom + 10);
        overwrite_Button.Select();

        StartPosition = FormStartPosition.CenterParent;
    }

    private static void SetControlY(Control control, int y)
    {
        control.Location = new Point(control.Location.X, y);
    }

    private void Overwrite_ButtonClicked(object sender, EventArgs e)
    {
        OverwriteMode = HighLevel.OverwriteMode.Overwrite;
        Close();
    }

    private void Rename_ButtonClicked(object sender, EventArgs e)
    {
        OverwriteMode = HighLevel.OverwriteMode.Rename;
        Close();
    }

    private void Skip_ButtonClicked(object sender, EventArgs e)
    {
        OverwriteMode = HighLevel.OverwriteMode.Skip;
        Close();
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        Close();
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
    {
        if (keyData == Keys.Escape)
        {
            Cancel_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }
}
