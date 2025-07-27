using Ws2Explorer.HighLevel;
using Ws2Explorer.FileTypes;

namespace Ws2Explorer.Gui;

partial class DiffWindow : Form
{
    private static readonly char[] separator = ['\r', '\n'];
    private static bool saveOldOnlyChecked = false;
    private static bool saveNewOnlyChecked = true;
    private static bool saveChangedChecked = true;
    private static bool saveCommonChecked = false;
    private static string destinationText = "";

    public string[] OldFilenames { get; private set; } = [];
    public string[] NewFilenames { get; private set; } = [];
    public string Destination { get; private set; } = "";
    public DiffPartitionMode DiffPartitionMode { get; private set; } = DiffPartitionMode.None;
    public Type CreateArchiveType { get; private set; } = typeof(ArcFile);

    public DiffWindow(IEnumerable<string> newFilenames)
    {
        InitializeComponent();
        newFilenames_TextBox.Text = string.Join("\r\n", newFilenames);
        saveOldOnly_CheckBox.Checked = saveOldOnlyChecked;
        saveNewOnly_CheckBox.Checked = saveNewOnlyChecked;
        saveChanged_CheckBox.Checked = saveChangedChecked;
        saveCommon_CheckBox.Checked = saveCommonChecked;
        destination_TextBox.Text = destinationText;

        StartPosition = FormStartPosition.CenterParent;
    }

    private void OK_ButtonClicked(object sender, EventArgs e)
    {
        var dst = destination_TextBox.Text.Trim();
        if (dst.Length == 0)
        {
            MessageBox.Show(
                "Destination path is empty.",
                "Error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            return;
        }

        var mode = DiffPartitionMode.None;
        if (saveOldOnly_CheckBox.Checked)
        {
            mode |= DiffPartitionMode.Old;
        }
        if (saveNewOnly_CheckBox.Checked)
        {
            mode |= DiffPartitionMode.New;
        }
        if (saveChanged_CheckBox.Checked)
        {
            mode |= DiffPartitionMode.Changed;
        }
        if (saveCommon_CheckBox.Checked)
        {
            mode |= DiffPartitionMode.Common;
        }

        if (archive_Radio.Checked)
        {
            CreateArchiveType = typeof(ArcFile);
        }
        else if (legacyArchive8_Radio.Checked)
        {
            CreateArchiveType = typeof(LegacyArc8File);
        }
        else if (legacyArchive12_Radio.Checked)
        {
            CreateArchiveType = typeof(LegacyArc12File);
        }

        var oldFilenames = oldFilenames_TextBox.Text
            .Split(separator, StringSplitOptions.RemoveEmptyEntries);
        var newFilenames = newFilenames_TextBox.Text
            .Split(separator, StringSplitOptions.RemoveEmptyEntries);

        if (mode == DiffPartitionMode.None ||
            oldFilenames.Length == 0 ||
            newFilenames.Length == 0)
        {
            DialogResult = DialogResult.Cancel;
            return;
        }

        OldFilenames = oldFilenames;
        NewFilenames = newFilenames;
        Destination = dst;
        DiffPartitionMode = mode;
        DialogResult = DialogResult.OK;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        DialogResult = DialogResult.Cancel;
    }

    private void BrowseOldFiles_ButtonClicked(object sender, EventArgs e)
    {
        if (PickerDialog.ShowMultiOpenFileDialog("Select old files", out var filenames))
        {
            if (oldFilenames_TextBox.Text.Length > 0 && oldFilenames_TextBox.Text[^1] != '\n')
            {
                oldFilenames_TextBox.AppendText("\r\n");
            }
            oldFilenames_TextBox.AppendText(string.Join("\r\n", filenames));
        }
    }

    private void BrowseNewFiles_ButtonClicked(object sender, EventArgs e)
    {
        if (PickerDialog.ShowMultiOpenFileDialog("Select new files", out var filenames))
        {
            if (newFilenames_TextBox.Text.Length > 0 && newFilenames_TextBox.Text[^1] != '\n')
            {
                newFilenames_TextBox.AppendText("\r\n");
            }
            newFilenames_TextBox.AppendText(string.Join("\r\n", filenames));
        }
    }

    private void BrowseDestination_Button(object sender, EventArgs e)
    {
        if (PickerDialog.ShowOpenFileDialog("Select save destination", out var filename))
        {
            destination_TextBox.Text = filename;
        }
    }

    private void DiffForm_Closed(object sender, FormClosedEventArgs e)
    {
        saveOldOnlyChecked = saveOldOnly_CheckBox.Checked;
        saveNewOnlyChecked = saveNewOnly_CheckBox.Checked;
        saveChangedChecked = saveChanged_CheckBox.Checked;
        saveCommonChecked = saveCommon_CheckBox.Checked;
        destinationText = destination_TextBox.Text;
    }
}
