using System.Globalization;

namespace Ws2Explorer.Gui;

partial class XorKeyWindow : Form
{
    public byte XorKey { get; private set; }

    public XorKeyWindow()
    {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterParent;
    }

    private void Ok_ButtonClicked(object sender, EventArgs e)
    {
        byte key;
        var text = key_TextBox.Text.Trim();
        if (text.StartsWith("0x", StringComparison.InvariantCultureIgnoreCase))
        {
            if (!byte.TryParse(text[2..], NumberStyles.HexNumber, null, out key))
            {
                MessageBox.Show(
                    "Please enter a valid XOR key (0x00-0xFF).",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }
        }
        else if (!byte.TryParse(text, out key))
        {
            MessageBox.Show(
                "Please enter a valid XOR key (0-255).",
                "Error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            return;
        }

        XorKey = key;
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
            Ok_ButtonClicked(this, EventArgs.Empty);
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }
}
