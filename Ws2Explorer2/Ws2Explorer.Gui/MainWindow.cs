using Microsoft.WindowsAPICodePack.Dialogs;
using NAudio.Vorbis;
using NAudio.Wave;
using ScintillaNET;
using System.Drawing.Text;
using System.Globalization;
using System.Runtime.InteropServices;
using System.Text;

namespace Ws2Explorer.Gui;

partial class MainWindow : Form
{
    private readonly ApplicationState state;
    private readonly CommonOpenFileDialog openFileDialog = new();
    private readonly System.Windows.Forms.Timer statusClear_Timer = new();
    private int filesListViewFileSizeColumnWidth;
    private bool filesListViewColumnWidthChanging;

    private readonly Scintilla textPreview_Scintilla;

    private readonly PictureBox imagePreview_PictureBox;

    private readonly Label fontPreview_Label;
    private PrivateFontCollection fontCollection = new();
    private GCHandle fontGCHandle = GCHandle.Alloc(Array.Empty<byte>(), GCHandleType.Pinned);

    private readonly WaveOutEvent audioPlayer;
    private VorbisWaveReader? audioReader;
    private readonly Button audioPlay_Button;

    public MainWindow(string? openPath)
    {
        static Color IntToColorInvert(int rgb)
        {
            byte r = (byte)(rgb >> 16);
            byte g = (byte)(rgb >> 8);
            byte b = (byte)rgb;
            return Color.FromArgb(
                255,
                255 - r,
                255 - g,
                255 - b);
        }

        InitializeComponent();

        // Create status clear timer
        statusClear_Timer.Tick += (sender, e) =>
        {
            status_StatusLabel.Text = string.Empty;
            statusClear_Timer.Stop();
        };
        statusClear_Timer.Interval = 4000;

        // Add version to title
        if (Application.ProductVersion.Contains('+'))
        {
            // Untagged version identified by commit hash
            Text += $" @{Application.ProductVersion.Split('+')[^1][..7]}";
        }
        else
        {
            // Tagged version
            Text += $" {Application.ProductVersion}";
        }

        // Hide status bar
        progress_ProgressBar.Visible = false;
        cancel_Button.Visible = false;

        filesListViewFileSizeColumnWidth = files_ListView.Columns[1].Width;
        files_ListView.Columns[0].Width = files_ListView.ClientSize.Width - filesListViewFileSizeColumnWidth;

        // Create preview controls
#pragma warning disable CS0618 // Type or member is obsolete (Lexer)
        textPreview_Scintilla = new Scintilla
        {
            BorderStyle = ScintillaNET.BorderStyle.FixedSingle,
            BiDirectionality = BiDirectionalDisplayType.Disabled,
            UseRightToLeftReadingLayout = false,
            CaretLineBackColor = Color.Black,
            CaretLineVisible = false,
            TabIndents = true,
            Dock = DockStyle.Fill,
            Lexer = Lexer.Cpp,
            LexerName = "cpp",
            WrapMode = WrapMode.None,
            ScrollWidth = 49,
        };
#pragma warning restore CS0618 // Type or member is obsolete (Lexer)
        textPreview_Scintilla.Margins.Capacity = 5;
        textPreview_Scintilla.StyleResetDefault();
        textPreview_Scintilla.Styles[Style.Default].Font = "Consolas";
        textPreview_Scintilla.Styles[Style.Default].Size = 10;
        textPreview_Scintilla.Styles[Style.Default].BackColor = IntToColorInvert(0x000000);
        textPreview_Scintilla.Styles[Style.Default].ForeColor = IntToColorInvert(0xFFFFFF);
        textPreview_Scintilla.Styles[Style.Default].ForeColor = IntToColorInvert(0xFFFFFF);
        textPreview_Scintilla.StyleClearAll();
        textPreview_Scintilla.Styles[Style.Cpp.Identifier].ForeColor = IntToColorInvert(0xD0DAE2);
        textPreview_Scintilla.Styles[Style.Cpp.Comment].ForeColor = IntToColorInvert(0xBD758B);
        textPreview_Scintilla.Styles[Style.Cpp.CommentLine].ForeColor = IntToColorInvert(0x40BF57);
        textPreview_Scintilla.Styles[Style.Cpp.CommentDoc].ForeColor = IntToColorInvert(0x2FAE35);
        textPreview_Scintilla.Styles[Style.Cpp.Number].ForeColor = IntToColorInvert(0xFFFF00);
        textPreview_Scintilla.Styles[Style.Cpp.String].ForeColor = IntToColorInvert(0xFFFF00);
        textPreview_Scintilla.Styles[Style.Cpp.Character].ForeColor = IntToColorInvert(0xE95454);
        textPreview_Scintilla.Styles[Style.Cpp.Preprocessor].ForeColor = IntToColorInvert(0x8AAFEE);
        textPreview_Scintilla.Styles[Style.Cpp.Operator].ForeColor = IntToColorInvert(0xE0E0E0);
        textPreview_Scintilla.Styles[Style.Cpp.Regex].ForeColor = IntToColorInvert(0xff00ff);
        textPreview_Scintilla.Styles[Style.Cpp.CommentLineDoc].ForeColor = IntToColorInvert(0x77A7DB);
        textPreview_Scintilla.Styles[Style.Cpp.Word].ForeColor = IntToColorInvert(0x48A8EE);
        textPreview_Scintilla.Styles[Style.Cpp.Word2].ForeColor = IntToColorInvert(0xF98906);
        textPreview_Scintilla.Styles[Style.Cpp.CommentDocKeyword].ForeColor = IntToColorInvert(0xB3D991);
        textPreview_Scintilla.Styles[Style.Cpp.CommentDocKeywordError].ForeColor = IntToColorInvert(0xFF0000);
        textPreview_Scintilla.Styles[Style.Cpp.GlobalClass].ForeColor = IntToColorInvert(0x48A8EE);
        textPreview_Scintilla.SetKeywords(0, "class extends implements import interface new case do while else if for in switch throw get set function var try catch finally while with default break continue delete return each const namespace package include use is as instanceof typeof author copy default deprecated eventType example exampleText exception haxe inheritDoc internal link mtasc mxmlc param private return see serial serialData serialField since throws usage version langversion playerversion productversion dynamic private public partial static intrinsic internal native override protected AS3 final super this arguments null Infinity NaN undefined true false abstract as base bool break by byte case catch char checked class const continue decimal default delegate do double descending explicit event extern else enum false finally fixed float for foreach from goto group if implicit in int interface internal into is lock long new null namespace object operator out override orderby params private protected public readonly ref return switch struct sbyte sealed short sizeof stackalloc static string select this throw true try typeof uint ulong unchecked unsafe ushort using var virtual volatile void while where yield");
        textPreview_Scintilla.SetKeywords(1, "void Null ArgumentError arguments Array Boolean Class Date DefinitionError Error EvalError Function int Math Namespace Number Object RangeError ReferenceError RegExp SecurityError String SyntaxError TypeError uint XML XMLList Boolean Byte Char DateTime Decimal Double Int16 Int32 Int64 IntPtr SByte Single UInt16 UInt32 UInt64 UIntPtr Void Path File System Windows Forms ScintillaNET");

        imagePreview_PictureBox = new PictureBox
        {
            Dock = DockStyle.Fill,
            SizeMode = PictureBoxSizeMode.Zoom,
        };

        fontPreview_Label = new Label
        {
            UseCompatibleTextRendering = true,
            Dock = DockStyle.Fill,
            TextAlign = ContentAlignment.MiddleCenter,
            Text = "The quick brown fox jumps over the lazy dog\n0123456789",
        };

        audioPlayer = new WaveOutEvent();
        audioPlay_Button = new Button
        {
            Text = "Play",
            Dock = DockStyle.Bottom,
            Height = 30,
        };
        audioPlay_Button.Click += AudioPlay_ButtonClicked;

        // Create state
        state = new ApplicationState(openPath)
        {
            Progress = new Progress<TaskProgressInfo>(OnProgress),
            OnError = OnError,
            OnInfo = OnInfo,
            OnStatus = OnStatus,
            OnFileList = OnFileList,
            OnPathText = OnPathText,
            OnFileCaption = OnFileCaption,
            OnPreviewBinary = OnPreviewBinary,
            OnPreviewText = OnPreviewText,
            OnPreviewPng = OnPreviewPng,
            OnPreviewOgg = OnPreviewOgg,
            OnPreviewFont = OnPreviewFont,
        };
        state.Init();
    }

    private void OnError(Exception ex)
    {
        using var dialog = new ErrorWindow(GetDetailedErrorMessage(ex));
        dialog.ShowDialog();
    }

    private static void OnInfo(string message)
    {
        MessageBox.Show(message);
    }

    private void OnStatus(string message)
    {
        status_StatusLabel.Text = message;
        statusClear_Timer.Stop();
        statusClear_Timer.Start();
    }

    private void OnProgress(TaskProgressInfo info)
    {
        Invoke(() =>
        {
            int v = (int)(info.Value * 100);
            if (v >= progress_ProgressBar.Maximum)
            {
                task_StatusLabel.Text = string.Empty;
                progress_ProgressBar.Visible = false;
                cancel_Button.Visible = false;
            }
            else
            {
                task_StatusLabel.Text = info.Description;
                progress_ProgressBar.Visible = true;
                cancel_Button.Visible = true;
                // Workaround for progress bar not updating
                progress_ProgressBar.Value = v + 1;
                progress_ProgressBar.Value = v;
            }
        });
    }

    private void OnFileList(IReadOnlyCollection<FileInfo> fileList)
    {
        var nfi = (NumberFormatInfo)CultureInfo.InvariantCulture.NumberFormat.Clone();
        nfi.NumberGroupSeparator = " ";

        files_ListView.Items.Clear();
        files_ListView.BeginUpdate();
        foreach (var file in fileList)
        {
            files_ListView.Items.Add(new ListViewItem(
                new string[] {
                    (file.IsDirectory && file.Filename != "..") ? $"{file.Filename}/" : file.Filename,
                    file.FileSize?.ToString("#,0", nfi) ?? string.Empty,
                }
            ));
        }
        files_ListView.EndUpdate();
    }

    private void OnPathText(string text)
    {
        path_TextBox.Text = text;
        path_TextBox.SelectionStart = path_TextBox.Text.Length;
    }

    private void OnFileCaption(string caption)
    {
        caption_StatusLabel.Text = caption;
    }

    public void OnPreviewBinary(BinaryStream stream)
    {
        audioPlayer.Stop();

        OnPreviewText(HexPreview(stream.Span));
    }

    public void OnPreviewText(string text)
    {
        audioPlayer.Stop();

        textPreview_Scintilla.Text = text;
        if (!panels_SplitContainer.Panel2.Controls.Contains(textPreview_Scintilla))
        {
            panels_SplitContainer.Panel2.Controls.Clear();
            panels_SplitContainer.Panel2.Controls.Add(textPreview_Scintilla);
        }
    }

    public void OnPreviewPng(BinaryStream stream)
    {
        audioPlayer.Stop();

        var array = new byte[stream.Length];
        stream.Span.CopyTo(array);
        var memoryStream = new MemoryStream(array);
        imagePreview_PictureBox.Image = Image.FromStream(memoryStream);
        if (!panels_SplitContainer.Panel2.Controls.Contains(imagePreview_PictureBox))
        {
            panels_SplitContainer.Panel2.Controls.Clear();
            panels_SplitContainer.Panel2.Controls.Add(imagePreview_PictureBox);
        }
    }

    public void OnPreviewOgg(BinaryStream stream)
    {
        audioPlayer.Stop();
        audioReader?.Dispose();
        var array = new byte[stream.Length];
        stream.Span.CopyTo(array);
        var memoryStream = new MemoryStream(array);
        audioReader = new VorbisWaveReader(memoryStream);
        audioPlayer.Init(audioReader);

        audioPlay_Button.Text = "Play";
        if (!panels_SplitContainer.Panel2.Controls.Contains(audioPlay_Button))
        {
            panels_SplitContainer.Panel2.Controls.Clear();
            panels_SplitContainer.Panel2.Controls.Add(audioPlay_Button);
        }
    }

    public void OnPreviewFont(BinaryStream stream)
    {
        audioPlayer.Stop();

        fontCollection.Dispose();
        fontCollection = new PrivateFontCollection();

        fontGCHandle.Free();
        fontGCHandle = GCHandle.Alloc(new byte[stream.Length], GCHandleType.Pinned);
        stream.Span.CopyTo((byte[])fontGCHandle.Target!);
        fontCollection.AddMemoryFont(fontGCHandle.AddrOfPinnedObject(), stream.Length);

        fontPreview_Label.Font = new Font(fontCollection.Families[0], 20);
        if (!panels_SplitContainer.Panel2.Controls.Contains(fontPreview_Label))
        {
            panels_SplitContainer.Panel2.Controls.Clear();
            panels_SplitContainer.Panel2.Controls.Add(fontPreview_Label);
        }
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
    {
        if (files_ListView.Focused)
        {
            switch (keyData)
            {
                case Keys.Control | Keys.C:
                    Copy_MenuItemClicked(this, EventArgs.Empty);
                    return true;
                case Keys.Control | Keys.V:
                    Paste_MenuItemClicked(this, EventArgs.Empty);
                    return true;
                case Keys.Enter:
                    Files_ListViewDoubleClicked(this, EventArgs.Empty);
                    return true;
                case Keys.Delete:
                    Delete_MenuItemClicked(this, EventArgs.Empty);
                    return true;
                case Keys.Back:
                    GoToParent_MenuItemClicked(this, EventArgs.Empty);
                    return true;
                case Keys.Escape:
                    files_ListView.SelectedIndices.Clear();
                    return true;
                case Keys.Control | Keys.A:
                    files_ListView.SelectedIndices.Clear();
                    for (var i = 0; i < files_ListView.Items.Count; i++)
                    {
                        files_ListView.SelectedIndices.Add(i);
                    }
                    return true;
            }
        }
        else if (path_TextBox.SelectionStart == path_TextBox.Text.Length)
        {
            switch (keyData)
            {
                case Keys.Tab:
                    state.AutoCompletePath(path_TextBox.Text);
                    return true;
                case Keys.Enter:
                    state.OpenPath(path_TextBox.Text);
                    return true;
            }
        }
        return base.ProcessCmdKey(ref msg, keyData);
    }

    private void NewFile_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new NewFileWindow();
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            state.CreateNewFile(dialog.Filename);
        }
    }

    private void Open_MenuItemClicked(object sender, EventArgs e)
    {
        openFileDialog.IsFolderPicker = false;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            state.OpenPath(openFileDialog.FileName);
        }
    }

    private void OpenFolder_MenuItemClicked(object sender, EventArgs e)
    {
        openFileDialog.IsFolderPicker = true;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            state.OpenPath(openFileDialog.FileName);
        }
    }

    private void Export_MenuItemClicked(object sender, EventArgs e)
    {
        state.ExportSelectedFile(filenames =>
        {
            if (filenames.Length == 1)
            {
                var filename = filenames[0];
                var ext = Path.GetExtension(filename);
                var filter = string.IsNullOrEmpty(ext)
                    ? new CommonFileDialogFilter("All files", "*")
                    : new CommonFileDialogFilter($"{ext} file", $"*{ext}");
                using var saveFileDialog = new CommonSaveFileDialog();
                saveFileDialog.Filters.Add(filter);
                saveFileDialog.DefaultFileName = "file";
                if (saveFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
                {
                    var dst = saveFileDialog.FileName;
                    return [dst.EndsWith(".*") ? dst[..^2] : dst];
                }
                return null;
            }
            else
            {
                openFileDialog.IsFolderPicker = true;
                if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
                {
                    return filenames
                        .Select(f => Path.Combine(openFileDialog.FileName, f))
                        .ToArray();
                }
                return null;
            }
        });
    }

    private void Reveal_MenuItemClicked(object sender, EventArgs e)
    {
        state.RevealInFileExplorer();
    }

    private void SetEditors_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new SetEditorsWindow(state.EditorSettings);
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            state.EditorSettings = dialog.EditorSettings;
        }
    }

    private void Exit_MenuItemClicked(object sender, EventArgs e)
    {
        Close();
    }

    private void EditInApp_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(null);
    }

    private void EditAsText_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(EditorType.Text);
    }

    private void EditAsImage_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(EditorType.Image);
    }

    private void EditAsHex_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(EditorType.Hex);
    }

    private void Rename_MenuItemClicked(object sender, EventArgs e)
    {
        state.RenameFile(oldName =>
        {
            using var dialog = new RenameWindow(oldName);
            return dialog.ShowDialog() == DialogResult.OK
                ? dialog.Filename : oldName;
        });
    }

    private void Delete_MenuItemClicked(object sender, EventArgs e)
    {
        state.DeleteSelectedFiles(files =>
        {
            var text = $"Delete files:\n{string.Join("\n", files)}";
            return MessageBox.Show(
                text,
                "Delete files",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question,
                MessageBoxDefaultButton.Button1) == DialogResult.Yes;
        });
    }

    private void Duplicate_MenuItemClicked(object sender, EventArgs e)
    {
        state.DuplicateSelectedFile(existing =>
        {
            using var dialog = new OverwriteWindow(existing);
            dialog.ShowDialog();
            return dialog.OverwriteMode;
        });
    }

    private void Copy_MenuItemClicked(object sender, EventArgs e)
    {
        state.CopySelectedFiles();
    }

    private void Paste_MenuItemClicked(object sender, EventArgs e)
    {
        state.PasteFiles(existing =>
        {
            using var dialog = new OverwriteWindow(existing);
            dialog.ShowDialog();
            return dialog.OverwriteMode;
        });
    }

    private void PnaAddEntry_MenuItemClicked(object sender, EventArgs e)
    {
        state.AddPnaEntry();
    }

    private void PnaSwap_MenuItemClicked(object sender, EventArgs e)
    {
        state.SwapSelectedPnaEntries();
    }

    private void Refresh_MenuItemClicked(object sender, EventArgs e)
    {
        state.RefreshFolder();
    }

    private void GoToParent_MenuItemClicked(object sender, EventArgs e)
    {
        state.OpenParentFolder();
    }

    private void GoBack_MenuItemClicked(object sender, EventArgs e)
    {
        state.GoBack();
    }

    private void GoForward_MenuItemClicked(object sender, EventArgs e)
    {
        state.GoForward();
    }

    private void WordWrap_MenuItemCheckChanged(object sender, EventArgs e)
    {
        textPreview_Scintilla.WrapMode = wordWrap_MenuItem.Checked
            ? WrapMode.Word : WrapMode.None;
    }

    private void ViewMetadata_MenuItemClicked(object sender, EventArgs e)
    {
        state.ShowFileMetadata();
    }

    private void PnaShowEmpty_MenuItemCheckChanged(object sender, EventArgs e)
    {
        state.SetShowEmptyPnaFiles(pnaShowEmpty_MenuItem.Checked);
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        state.CancelTask();
    }

    private void Files_ListViewDoubleClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenSelectedFolder(index);
        }
    }

    private void Files_ListViewSelectedIndexChanged(object sender, EventArgs e)
    {
        state.SelectFiles(files_ListView.SelectedIndices.Cast<int>());
    }

    private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
    {
        state.Close();
    }

    private void Files_ListViewClientSizeChanged(object sender, EventArgs e)
    {
        Files_ListViewColumnWidthChanged(sender, new ColumnWidthChangedEventArgs(1));
    }

    private void Files_ListViewColumnWidthChanged(object sender, ColumnWidthChangedEventArgs e)
    {
        if (!filesListViewColumnWidthChanging)
        {
            filesListViewColumnWidthChanging = true;
            try
            {
                files_ListView.Columns[1 - e.ColumnIndex].Width =
                    files_ListView.ClientSize.Width - files_ListView.Columns[e.ColumnIndex].Width;
                filesListViewFileSizeColumnWidth = files_ListView.Columns[1].Width;
            }
            finally
            {
                filesListViewColumnWidthChanging = false;
            }
        }
    }

    private void OpenAsArc_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<ArcFile>(index);
        }
    }

    private void OpenAsPna_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<PnaFile>(index);
        }
    }

    private void OpenAsPan_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<PanFile>(index);
        }
    }

    private void OpenAsPtf_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<PtfFile>(index);
        }
    }

    private void OpenAsWs2_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<Ws2File>(index);
        }
    }

    private void CreateArc_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<ArcFile>(new CommonFileDialogFilter("ARC file", "*.arc"));
    }

    private void CreatePna_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<PnaFile>(new CommonFileDialogFilter("PNA file", "*.pna"));
    }

    private void CreatePan_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<PanFile>(new CommonFileDialogFilter("PAN file", "*.pan"));
    }

    private void CreatePtf_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<PtfFile>(new CommonFileDialogFilter("PTF file", "*.ptf"));
    }

    private void CreateWs2_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<Ws2File>(new CommonFileDialogFilter("WS2 file", "*.ws2"));
    }

    private void CreateArchive<T>(CommonFileDialogFilter filter)
        where T : class, IArchive<T>
    {
        using var saveFileDialog = new CommonSaveFileDialog();
        saveFileDialog.Filters.Add(filter);
        saveFileDialog.DefaultFileName = "file";
        if (saveFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            var dst = saveFileDialog.FileName;
            state.CreateArchive<T>(dst);
        }
    }

    private void About_MenuItemClicked(object sender, EventArgs e)
    {
        MessageBox.Show(
            $"{Text} by Kevin Lu\n" +
            "\n" +
            "Licensed under GPLv3\n" +
            "https://github.com/kevlu123/VN-Patching-Tools/tree/master/Ws2Explorer",
            "About",
            MessageBoxButtons.OK,
            MessageBoxIcon.Information);
    }

    private void AudioPlay_ButtonClicked(object? sender, EventArgs e)
    {
        if (audioPlayer.PlaybackState == PlaybackState.Stopped)
        {
            audioPlayer.Play();
            audioPlay_Button.Text = "Stop";
        }
        else
        {
            audioPlayer.Stop();
            audioPlay_Button.Text = "Play";
        }
    }

    private void Path_TextBoxDragDropped(object sender, DragEventArgs e)
    {
        var files = (string[]?)e.Data?.GetData(DataFormats.FileDrop);
        if (files != null && files.Length != 0)
        {
            path_TextBox.Text = files[0];
        }
    }

    private void Path_TextBoxDragOver(object sender, DragEventArgs e)
    {
        e.Effect = e.Data?.GetDataPresent(DataFormats.FileDrop) == true
            ? DragDropEffects.Link
            : DragDropEffects.None;
    }

    private void Files_ListViewDragDropped(object sender, DragEventArgs e)
    {
        var files = (string[]?)e.Data?.GetData(DataFormats.FileDrop);
        if (files != null && files.Length != 0)
        {
            state.InsertFiles(files, existing =>
            {
                using var dialog = new OverwriteWindow(existing);
                dialog.ShowDialog();
                return dialog.OverwriteMode;
            });
        }
    }

    private void Files_ListViewDragOver(object sender, DragEventArgs e)
    {
        e.Effect = e.Data?.GetDataPresent(DataFormats.FileDrop) == true
            ? DragDropEffects.Copy
            : DragDropEffects.None;
    }

    private static string HexPreview(ReadOnlySpan<byte> data)
    {
        const int MAX_LENGTH = 0x10000;
        bool truncated = data.Length > MAX_LENGTH;
        if (truncated)
        {
            data = data[..(MAX_LENGTH)];
        }

        var sb = new StringBuilder();
        for (int i = 0; i < data.Length; i += 16)
        {
            sb.Append($"{i:X4}  ");
            for (int j = 0; j < 16; j++)
            {
                if (i + j < data.Length)
                {
                    sb.Append($"{data[i + j]:X2} ");
                    if (j == 7)
                    {
                        sb.Append(' ');
                    }
                }
                else
                {
                    sb.Append("   ");
                }
            }
            sb.Append(' ');
            for (int j = 0; j < 16; j++)
            {
                if (i + j < data.Length)
                {
                    var c = data[i + j];
                    sb.Append(c >= 32 && c < 127 ? (char)c : '.');
                }
            }
            sb.AppendLine();
        }

        if (truncated)
        {
            sb.AppendLine("...");
        }
        return sb.ToString();
    }

    public static string GetDetailedErrorMessage(Exception exception)
    {
        var message = new StringBuilder();
        message.AppendLine($"[{exception.GetType().FullName}]");
        message.AppendLine(exception.Message);
        if (exception is AggregateException aggregateException)
        {
            foreach (var innerException in aggregateException.InnerExceptions)
            {
                message.AppendLine(GetDetailedErrorMessage(innerException));
            }
        }
        else if (exception.InnerException != null)
        {
            message.AppendLine();
            message.AppendLine("======== Caused by ========");
            message.AppendLine(GetDetailedErrorMessage(exception.InnerException));
        }
        else
        {
            message.AppendLine(exception.StackTrace);
        }
        return message.ToString();
    }
}
