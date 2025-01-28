using Microsoft.WindowsAPICodePack.Dialogs;

namespace Ws2Explorer.Gui;

static class PickerDialog
{
    private static readonly CommonOpenFileDialog openFileDialog = new();

    public static bool ShowSaveFileDialog(string title, string fileToSave, out string pickedFile)
    {
        var ext = Path.GetExtension(fileToSave);
        var filter = string.IsNullOrEmpty(ext)
            ? new CommonFileDialogFilter("All files", "*")
            : new CommonFileDialogFilter($"{ext} file", $"*{ext}");
        using var saveFileDialog = new CommonSaveFileDialog();
        saveFileDialog.Filters.Add(filter);
        saveFileDialog.DefaultFileName = fileToSave;
        saveFileDialog.Title = title;
        if (saveFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            var dst = saveFileDialog.FileName;
            pickedFile = dst.EndsWith(".*") ? dst[..^2] : dst;
            return true;
        }
        pickedFile = string.Empty;
        return false;
    }

    public static bool ShowOpenFileDialog(string title, out string pickedFile)
    {
        openFileDialog.IsFolderPicker = false;
        openFileDialog.Multiselect = false;
        openFileDialog.Title = title;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            pickedFile = openFileDialog.FileName;
            return true;
        }
        pickedFile = string.Empty;
        return false;
    }

    public static bool ShowMultiOpenFileDialog(string title, out string[] pickedFiles)
    {
        openFileDialog.IsFolderPicker = false;
        openFileDialog.Multiselect = true;
        openFileDialog.Title = title;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            pickedFiles = openFileDialog.FileNames.ToArray();
            return true;
        }
        pickedFiles = [];
        return false;
    }

    public static bool ShowOpenFolderDialog(string title, out string pickedFolder)
    {
        openFileDialog.IsFolderPicker = true;
        openFileDialog.Multiselect = false;
        openFileDialog.Title = title;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            pickedFolder = openFileDialog.FileName;
            return true;
        }
        pickedFolder = string.Empty;
        return false;
    }
}
