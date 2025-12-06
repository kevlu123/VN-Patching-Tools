using System.Drawing.Text;
using System.Globalization;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.WindowsAPICodePack.Dialogs;
using NAudio.Vorbis;
using NAudio.Wave;
using ScintillaNET;
using Ws2Explorer.Compiler;
using Ws2Explorer.FileTypes;
using FormLabel = System.Windows.Forms.Label;
using FormTimer = System.Windows.Forms.Timer;

namespace Ws2Explorer.Gui;

partial class MainWindow : Form
{
    private enum SortMode
    {
        Name,
        FileSize,
        Type,
    }

    private static readonly Comparison<FileInfo>[] SortModes = [
        NameFileSort,
        FileSizeFileSort,
        TypeFileSort,
    ];

    private const string CONFIG_FILENAME = "config.json";

    private readonly Config config;
    private readonly ApplicationState state;
    private readonly FormTimer statusClear_Timer;
    private readonly FormTimer saveConfig_Timer;
    private bool filesListViewColumnWidthChanging;

    private readonly Scintilla textPreview_Scintilla;

    private readonly PictureBox imagePreview_PictureBox;

    private readonly FormLabel fontPreview_Label;
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

        this.config = new Config();
        var config = Config.Load(GetConfigPath());

        // Create status clear timer
        statusClear_Timer = new FormTimer();
        statusClear_Timer.Tick += (sender, e) =>
        {
            status_StatusLabel.Text = string.Empty;
            statusClear_Timer.Stop();
        };
        statusClear_Timer.Interval = 4000;

        // Create auto save config timer
        saveConfig_Timer = new FormTimer();
        saveConfig_Timer.Tick += (sender, e) => config?.Save();
        saveConfig_Timer.Interval = 30000;
        saveConfig_Timer.Start();

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

        // Hide file list view horizontal scrollbar
        ShowScrollBar(files_ListView.Handle, 0 /* SB_HORZ */, 0 /* Hide */);

        // Set file list view column width
        Files_ListViewColumnWidthChanged(this, new ColumnWidthChangedEventArgs(1));

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
            ReadOnly = true,
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

        fontPreview_Label = new FormLabel
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
        state = new ApplicationState(openPath ?? config.OpenFolder)
        {
            Progress = new Progress<TaskProgressInfo>(OnProgress),
            SortFileList = NameFileSort,
            OnError = OnError,
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

        // Apply config
        try
        {
            bool maximized = config.WindowMaximized;
            Size = new Size(config.WindowWidth, config.WindowHeight);
            if (config.WindowX.HasValue && config.WindowY.HasValue)
            {
                StartPosition = FormStartPosition.Manual;
                Location = new Point(config.WindowX.Value, config.WindowY.Value);
            }
            if (maximized)
            {
                WindowState = FormWindowState.Maximized;
            }
            wordWrap_MenuItem.Checked = config.WordWrap;
            panels_SplitContainer.SplitterDistance = config.SplitterDistance;
            SortFileList((SortMode)config.SortColumn, config.SortInverted);
            files_ListView.Columns[1].Width = config.FileSizeColumnWidth;
            pnaShowEmpty_MenuItem.Checked = config.ShowEmptyPnaFiles;
        }
        catch (Exception ex)
        {
            OnError(ex);
            config = new Config(GetConfigPath());
        }
        this.config = config;
    }

    private static string GetConfigPath()
    {
        return Path.Combine(
            ApplicationState.GetExeFolderPath() ?? string.Empty,
            CONFIG_FILENAME);
    }

    private void OnError(Exception ex)
    {
        using var dialog = new InfoWindow("Error", ex.ToString());
        dialog.ShowDialog();
    }

    private void OnStatus(string message)
    {
        status_StatusLabel.Text = message;
        statusClear_Timer.Stop();
        statusClear_Timer.Start();
    }

    private void OnProgress(TaskProgressInfo info)
    {
        if (IsDisposed)
        {
            return;
        }
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
                [
                    (file.IsDirectory && file.Filename != "..") ? $"{file.Filename}/" : file.Filename,
                    file.FileSize?.ToString("#,0", nfi) ?? string.Empty,
                ]
            ));
        }
        files_ListView.EndUpdate();
    }

    private void OnPathText(string text)
    {
        path_TextBox.Text = text;
        path_TextBox.SelectionStart = path_TextBox.Text.Length;
        config.OpenFolder = text;
    }

    private void OnFileCaption(string caption)
    {
        caption_StatusLabel.Text = caption;
    }

    private void OnPreviewBinary(BinaryStream stream)
    {
        audioPlayer.Stop();

        OnPreviewText(HexPreview(stream.Span));
    }

    private void OnPreviewText(string text)
    {
        audioPlayer.Stop();

        textPreview_Scintilla.ReadOnly = false;
        textPreview_Scintilla.Text = text;
        textPreview_Scintilla.ReadOnly = true;
        if (!panels_SplitContainer.Panel2.Controls.Contains(textPreview_Scintilla))
        {
            panels_SplitContainer.Panel2.Controls.Clear();
            panels_SplitContainer.Panel2.Controls.Add(textPreview_Scintilla);
        }
    }

    private void OnPreviewPng(BinaryStream stream)
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

    private void OnPreviewOgg(BinaryStream stream)
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

    private void OnPreviewFont(BinaryStream stream)
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
        else
        {
            switch (keyData)
            {
                case Keys.Tab when path_TextBox.SelectionStart == path_TextBox.Text.Length:
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
        using var dialog = new NewFileWindow("New File");
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            state.CreateNewFile(dialog.Filename);
        }
    }

    private void Open_MenuItemClicked(object sender, EventArgs e)
    {
        if (PickerDialog.ShowOpenFileDialog("Open Archive", out var pickedFile))
        {
            state.OpenPath(pickedFile);
        }
    }

    private void OpenFolder_MenuItemClicked(object sender, EventArgs e)
    {
        if (PickerDialog.ShowOpenFolderDialog("Open Folder", out var pickedFolder))
        {
            state.OpenPath(pickedFolder);
        }
    }

    private void Export_MenuItemClicked(object sender, EventArgs e)
    {
        state.ExportSelectedFile(filenames =>
        {
            if (filenames.Count() == 1)
            {
                if (PickerDialog.ShowSaveFileDialog("Export", filenames.First(), out var pickedFile))
                {
                    return [pickedFile];
                }
                return null;
            }
            else
            {
                if (PickerDialog.ShowOpenFolderDialog("Export", out var pickedFolder))
                {
                    return filenames
                        .Select(f => Path.Combine(pickedFolder, f))
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
        using var dialog = new SetEditorsWindow(new EditorSettings
        {
            TextEditorPath = config.TextEditorPath,
            TextEditorArgs = config.TextEditorArgs,
            ImageEditorPath = config.ImageEditorPath,
            ImageEditorArgs = config.ImageEditorArgs,
            HexEditorPath = config.HexEditorPath,
            HexEditorArgs = config.HexEditorArgs,
        });
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            config.TextEditorPath = dialog.EditorSettings.TextEditorPath;
            config.TextEditorArgs = dialog.EditorSettings.TextEditorArgs;
            config.ImageEditorPath = dialog.EditorSettings.ImageEditorPath;
            config.ImageEditorArgs = dialog.EditorSettings.ImageEditorArgs;
            config.HexEditorPath = dialog.EditorSettings.HexEditorPath;
            config.HexEditorArgs = dialog.EditorSettings.HexEditorArgs;
        }
    }

    private void Exit_MenuItemClicked(object sender, EventArgs e)
    {
        Close();
    }

    private void EditInApp_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(editorType => editorType switch
        {
            EditorType.Text => (config.TextEditorPath, config.TextEditorArgs),
            EditorType.Image => (config.ImageEditorPath, config.ImageEditorArgs),
            EditorType.Hex => (config.HexEditorPath, config.HexEditorArgs),
            _ => throw new ArgumentException("Invalid editor type.", nameof(editorType))
        });
    }

    private void EditScriptInApp_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditScriptTextInApp(config.TextEditorPath, config.TextEditorArgs);
    }

    private void EditAsText_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(_ =>
            (config.TextEditorPath, config.TextEditorArgs)
        );
    }

    private void EditAsImage_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(_ =>
            (config.ImageEditorPath, config.ImageEditorArgs)
        );
    }

    private void EditAsHex_MenuItemClicked(object sender, EventArgs e)
    {
        state.EditSelectedFileInApp(_ =>
            (config.HexEditorPath, config.HexEditorArgs)
        );
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

    private void PnaWipAddEntry_MenuItemClicked(object sender, EventArgs e)
    {
        state.AddImageArchiveEntry();
    }

    private void PnaWipSwap_MenuItemClicked(object sender, EventArgs e)
    {
        state.SwapSelectedImageArchiveEntries();
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
        config.WordWrap = wordWrap_MenuItem.Checked;
    }

    private void ViewMetadata_MenuItemClicked(object sender, EventArgs e)
    {
        state.ShowFileMetadata(message => MessageBox.Show(message, "Metadata"));
    }

    private void PnaShowEmpty_MenuItemCheckChanged(object sender, EventArgs e)
    {
        state.SetShowEmptyPnaFiles(pnaShowEmpty_MenuItem.Checked);
        config.ShowEmptyPnaFiles = pnaShowEmpty_MenuItem.Checked;
    }

    private void Cancel_ButtonClicked(object sender, EventArgs e)
    {
        var result = MessageBox.Show(
            "Are you sure you want to cancel the current task?\nIf there is a write in progress, this may leave corrupted files.",
            "Cancel Task",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question,
            MessageBoxDefaultButton.Button2);
        if (result == DialogResult.Yes)
        {
            state.CancelTask();
        }
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
        config.Save();
    }

    private void MainForm_SizeChanged(object sender, EventArgs e)
    {
        config.WindowMaximized = WindowState == FormWindowState.Maximized;
        if (WindowState == FormWindowState.Normal)
        {
            config.WindowWidth = Width;
            config.WindowHeight = Height;
        }
    }

    private void MainForm_LocationChanged(object sender, EventArgs e)
    {
        if (WindowState == FormWindowState.Normal)
        {
            config.WindowX = Location.X;
            config.WindowY = Location.Y;
        }
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
                    files_ListView.ClientSize.Width
                    - files_ListView.Columns[e.ColumnIndex].Width;
                ShowScrollBar(files_ListView.Handle, 0 /* SB_HORZ */, 0 /* Hide */);
                config.FileSizeColumnWidth = files_ListView.Columns[1].Width;
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

    private void OpenAsLegacyArc8_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<LegacyArc8File>(index);
        }
    }

    private void OpenAsLegacyArc12_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<LegacyArc12File>(index);
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

    private void OpenAsWip_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<WipFile>(index);
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

    private void OpenAsWsc_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<WscFile>(index);
        }
    }

    private void OpenAsLng_MenuItemClicked(object sender, EventArgs e)
    {
        if (files_ListView.SelectedIndices.Count == 1)
        {
            var index = files_ListView.SelectedIndices[0];
            state.OpenArchiveAs<LngFile>(index);
        }
    }

    private void CreateArc_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<ArcFile>(new CommonFileDialogFilter("ARC file", "*.arc"));
    }

    private void CreateLegacyArc8_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<LegacyArc8File>(new CommonFileDialogFilter("ARC file", "*.arc"));
    }

    private void CreateLegacyArc12_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<LegacyArc12File>(new CommonFileDialogFilter("ARC file", "*.arc"));
    }

    private void CreatePna_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<PnaFile>(new CommonFileDialogFilter("PNA file", "*.pna"));
    }

    private void CreateWip_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<WipFile>(new CommonFileDialogFilter("WIP file", "*.WIP"));
    }

    private void CreatePan_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<PanFile>(new CommonFileDialogFilter("PAN file", "*.pan"));
    }

    private void CreatePtf_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new XorKeyWindow();
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            CreateArchive<PtfFile>(
                new CommonFileDialogFilter("PTF file", "*.ptf"),
                dst => state.CreatePtf(dst, dialog.XorKey));
        }
    }

    private void CreateWs2_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<Ws2File>(new CommonFileDialogFilter("WS2 file", "*.ws2"));
    }

    private void CreateWsc_MenuItemClicked(object sender, EventArgs e)
    {
        CreateArchive<WscFile>(new CommonFileDialogFilter("WSC file", "*.wsc"));
    }

    private void CreateLng_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new XorKeyWindow();
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            CreateArchive<PtfFile>(
                new CommonFileDialogFilter("LNG file", "*.lng"),
                dst => state.CreateLng(dst, dialog.XorKey));
        }
    }

    private void CreateArchive<T>(CommonFileDialogFilter filter, Action<string>? create = null)
        where T : class, IArchive<T>
    {
        using var saveFileDialog = new CommonSaveFileDialog();
        saveFileDialog.Filters.Add(filter);
        saveFileDialog.DefaultFileName = "file";
        if (saveFileDialog.ShowDialog() == CommonFileDialogResult.Ok)
        {
            var dst = saveFileDialog.FileName;
            if (create == null)
            {
                state.CreateArchive<T>(dst);
            }
            else
            {
                create(dst);
            }
        }
    }

    private void About_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new InfoWindow("About", string.Join("\r\n", [
            $"{Text} (GPLv3) by Kevin Lu",
            "  https://github.com/kevlu123/VN-Patching-Tools/tree/master/Ws2Explorer",
            "",
            "Libraries",
            "  Locale Emulator (GPLv3) by xupefei",
            "    https://github.com/xupefei/Locale-Emulator",
            "    https://github.com/xupefei/Locale-Emulator-Core",
        ]));
        dialog.ShowDialog();
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

    private void Files_ListViewColumnClicked(object sender, ColumnClickEventArgs e)
    {
        bool invert = state.SortFileList == SortModes[e.Column];
        SortFileList((SortMode)e.Column, invert);
    }

    private void Panels_SplitContainerSplitterMoving(object sender, SplitterCancelEventArgs e)
    {
        config.SplitterDistance = e.SplitX;
    }

    private void Panels_SplitContainerClientSizeChanged(object sender, EventArgs e)
    {
        panels_SplitContainer.SplitterDistance = config.SplitterDistance;
    }

    private void SortFileList(SortMode sortMode, bool invert)
    {
        var sort = SortModes[(int)sortMode];
        if (invert)
        {
            state.SortFileList = (a, b) => -sort(a, b);
        }
        else
        {
            state.SortFileList = sort;
        }

        config.SortColumn = (int)sortMode;
        config.SortInverted = invert;

        files_ListView.Columns[0].Text = "Name" + (sortMode == SortMode.Name ? (invert ? " ⌄" : " ⌃") : "");
        files_ListView.Columns[1].Text = (sortMode == SortMode.FileSize ? (invert ? "⌄ " : "⌃ ") : "") + "Size";

        sortNameAscending_MenuItem.Checked = sortMode == SortMode.Name && !invert;
        sortNameDescending_MenuItem.Checked = sortMode == SortMode.Name && invert;
        sortSizeAscending_MenuItem.Checked = sortMode == SortMode.FileSize && !invert;
        sortSizeDescending_MenuItem.Checked = sortMode == SortMode.FileSize && invert;
        sortTypeAscending_MenuItem.Checked = sortMode == SortMode.Type && !invert;
        sortTypeDescending_MenuItem.Checked = sortMode == SortMode.Type && invert;
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

    private static int NameFileSort(FileInfo lhs, FileInfo rhs)
    {
        int r = rhs.IsDirectory.CompareTo(lhs.IsDirectory);
        if (r != 0)
        {
            return r;
        }
        return string.Compare(lhs.Filename, rhs.Filename, StringComparison.InvariantCultureIgnoreCase);
    }

    private static int FileSizeFileSort(FileInfo lhs, FileInfo rhs)
    {
        int r = rhs.IsDirectory.CompareTo(lhs.IsDirectory);
        if (r != 0)
        {
            return r;
        }
        r = (rhs.FileSize ?? -1).CompareTo(lhs.FileSize ?? -1);
        if (r != 0)
        {
            return r;
        }
        return string.Compare(lhs.Filename, rhs.Filename, StringComparison.InvariantCultureIgnoreCase);
    }

    private static int TypeFileSort(FileInfo lhs, FileInfo rhs)
    {
        int r = rhs.IsDirectory.CompareTo(lhs.IsDirectory);
        if (r != 0)
        {
            return r;
        }
        r = string.Compare(Path.GetExtension(lhs.Filename), Path.GetExtension(rhs.Filename), StringComparison.InvariantCultureIgnoreCase);
        if (r != 0)
        {
            return r;
        }
        return string.Compare(lhs.Filename, rhs.Filename, StringComparison.InvariantCultureIgnoreCase);
    }

    [LibraryImport("user32")]
    private static partial void ShowScrollBar(IntPtr hwnd, int wBar, int bShow);

    private void SetEntry_MenuItemClicked(object sender, EventArgs e)
    {
        state.SetEntry((current, options) =>
        {
            using var dialog = new SetWs2EntryWindow(current, options);
            dialog.ShowDialog();
            return dialog.EntryPointName;
        });
    }

    private void LaunchGame_MenuItemClicked(object sender, EventArgs e)
    {
        state.LaunchGame();
    }

    private void ConvertLuacToText_MenuItemClicked(object sender, EventArgs e)
    {
        var result = MessageBox.Show(
            "This will convert compiled Lua files to text form by embedding a byte array. This will not decompile the scripts. Are you sure?",
            "Confirm",
            MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes)
        {
            state.ConvertLuacToText();
        }
    }

    private void ShowChoices_MenuItem(object sender, EventArgs e)
    {
        state.GetChoices(choiceInfos =>
        {
            var texts = new List<string>();
            foreach (var choiceInfo in choiceInfos)
            {
                texts.Add($"{choiceInfo.Filename}");
                foreach (var choice in choiceInfo.Ws2Choices)
                {
                    if (choice.JumpOp.Code == Opcode.WS2_JUMP_06)
                    {
                        // Jump
                        texts.Add($"  \"{choice.Text}\" -> Label {choice.JumpOp.Arguments[0].Label.Address}");
                    }
                    else if (choice.JumpOp.Code == Opcode.WS2_JUMP_FILE_07)
                    {
                        // Jump file
                        texts.Add($"  \"{choice.Text}\" -> {choice.JumpOp.Arguments[0].String}");
                    }
                }
                foreach (var choice in choiceInfo.WscChoices)
                {
                    if (choice.JumpOp.Code == Opcode.WSC_JUMP_06)
                    {
                        // Jump
                        texts.Add($"  \"{choice.Text}\" -> Label {choice.JumpOp.Arguments[0].Label.Address}");
                    }
                    else if (choice.JumpOp.Code == Opcode.WSC_JUMP_FILE_07)
                    {
                        // Jump file
                        texts.Add($"  \"{choice.Text}\" -> {choice.JumpOp.Arguments[0].String}");
                    }
                }
                texts.Add(string.Empty);
            }
            using var dialog = new InfoWindow("Choices", string.Join("\r\n", texts));
            dialog.ShowDialog();
        });
    }

    private void ShowFlowchart_MenuItemClicked(object sender, EventArgs e)
    {
        state.GetFlowchart(flowchart =>
        {
            using var dialog = new FlowchartWindow(flowchart);
            dialog.ShowDialog();
        });
    }

    private void ModifyNames_MenuItemClicked(object sender, EventArgs e)
    {
        state.ModifyNames(names =>
        {
            using var dialog = new ModifyNamesWindow(names);
            dialog.ShowDialog();
            return dialog.NameMapping;
        });
    }

    private void ChangePath_MenuItemClicked(object sender, EventArgs e)
    {
        path_TextBox.Select();
    }

    private void RecursiveExtract_MenuItemClicked(object sender, EventArgs e)
    {
        state.RecursiveExtract(() =>
        {
            if (!PickerDialog.ShowOpenFolderDialog("Extract", out var extractLocation))
            {
                return null;
            }

            using var dialog = new ExtractPatternWindow();
            if (dialog.ShowDialog() != DialogResult.OK)
            {
                return null;
            }
            var regex = dialog.Pattern;

            return (extractLocation, new Regex(regex));
        });
    }

    private void Diff_MenuItemClicked(object sender, EventArgs e)
    {
        state.DiffFiles(oldFilenames =>
        {
            using var dialog = new DiffWindow(oldFilenames);
            return dialog.ShowDialog() == DialogResult.OK
                ? (
                    dialog.OldFilenames,
                    dialog.NewFilenames,
                    dialog.Destination,
                    dialog.DiffPartitionMode,
                    dialog.CreateArchiveType
                )
                : null;
        });
    }

    private void NewDirectory_MenuItemClicked(object sender, EventArgs e)
    {
        using var dialog = new NewFileWindow("New Directory");
        if (dialog.ShowDialog() == DialogResult.OK)
        {
            state.CreateNewDirectory(dialog.Filename);
        }
    }

    private void ListFiles_MenuItemClicked(object sender, EventArgs e)
    {
        state.ListFilesInFolder(fileInfos =>
        {
            var entries = fileInfos.Select(fi => $"{fi.Filename,-30} {fi.FileSize?.ToString() ?? "-",10}");
            var text = string.Join("\r\n", entries);
            using var dialog = new InfoWindow("Files", text);
            dialog.ShowDialog();
        });
    }

    private void FindReferences_MenuItemClicked(object sender, EventArgs e)
    {
        state.FindReferences(
            () =>
            {
                using var dialog = new FindReferencesWindow();
                if (dialog.ShowDialog() == DialogResult.OK)
                {
                    return (dialog.SearchText, dialog.CaseSensitive, dialog.MatchWholeString);
                }
                return null;
            },
            refs =>
            {
                using var dialog = new InfoWindow(
                    "References",
                    string.Join("\r\n", refs.Select(r => $"({r.Value}) {r.Key}")));
                dialog.ShowDialog();
            });
    }

    private void Files_ListViewItemDragged(object sender, ItemDragEventArgs e)
    {
        state.ExtractSelectedFilesToTemp(filenames =>
        {
            var data = new DataObject(DataFormats.FileDrop, filenames);
            files_ListView.DoDragDrop(data, DragDropEffects.Copy);
        });
    }

    private void SortNameAscending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.Name, false);
    }

    private void SortNameDescending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.Name, true);
    }

    private void SortSizeAscending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.FileSize, false);
    }

    private void SortSizeDescending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.FileSize, true);
    }

    private void SortTypeAscending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.Type, false);
    }

    private void SortTypeDescending_MenuItemClicked(object sender, EventArgs e)
    {
        SortFileList(SortMode.Type, true);
    }

    private void WrapText_ButtonClicked(object sender, EventArgs e)
    {
        WordWrapWindow.Stats stats = null!;
        state.WordWrap(() =>
        {
            using var dialog = new WordWrapWindow();
            dialog.ShowDialog();
            stats = dialog.WordWrapStats;
            return dialog.WordWrapFunction;
        },
        () =>
        {
            if (stats.TextsExceedingMaxLines.Count > 0)
            {
                using var dialog = new InfoWindow(
                    "Warning",
                    $"{stats.TextsExceedingMaxLines.Count}/{stats.TotalTextsProcessed} texts exceeded the maximum line count. \r\n\r\n"
                        + "=================================== \r\n\r\n"
                        + string.Join(
                            "\r\n\r\n",
                            stats.TextsExceedingMaxLines.Select(lines => string.Join("\r\n", lines))));
                dialog.ShowDialog();
            }
        });
    }
}
