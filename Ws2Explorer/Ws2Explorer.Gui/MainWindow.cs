using Microsoft.WindowsAPICodePack.Dialogs;
using ScintillaNET;
using System.Collections.Specialized;
using System.ComponentModel.Design;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using FormTimer = System.Windows.Forms.Timer;

#if INCLUDE_VIDEO_PLAYER
using LibVLCSharp.WinForms;
using LibVLCSharp.Shared;
#endif

namespace Ws2Explorer.Gui;

public partial class MainWindow : Form {
    private enum ExternalEditorType {
        Text,
        Image,
        Hex,
    }

    class Terminal {
        private readonly TextBox inputControl;
        private readonly Scintilla outputControl;
        private readonly Func<CancellationTokenSource> ctsGetter;
        private readonly Ws2Explorer.Program program;
        private readonly List<string> history = new();
        private int historyIndex;

        public event EventHandler OnUpdateRequired = delegate { };

        public Terminal(TextBox inputControl, Scintilla outputControl, Func<CancellationTokenSource> ctsGetter) {
            this.inputControl = inputControl;
            this.outputControl = outputControl;
            this.ctsGetter = ctsGetter;

            program = new Ws2Explorer.Program();
            program.OnOutput += (_, text) => outputControl.AppendTextBypassReadonly(text + "\n");

            inputControl.KeyDown += KeyPressed;
        }

        private async void KeyPressed(object? sender, KeyEventArgs e) {
            switch (e.KeyData) {
                case Keys.Enter:
                    e.SuppressKeyPress = true;
                    history.Add(inputControl.Text);
                    historyIndex = history.Count;
                    await EnterKeyPressed();
                    break;
                case Keys.Up:
                    e.SuppressKeyPress = true;
                    if (historyIndex > 0) {
                        historyIndex--;
                        inputControl.Text = history[historyIndex];
                    }
                    break;
                case Keys.Down:
                    e.SuppressKeyPress = true;
                    if (historyIndex < history.Count - 1) {
                        historyIndex++;
                        inputControl.Text = history[historyIndex];
                    } else if (historyIndex == history.Count - 1) {
                        historyIndex++;
                        inputControl.Text = "";
                    }
                    break;
            }
        }

        private async Task EnterKeyPressed() {
            var input = inputControl.Text;
            inputControl.Text = "";
            outputControl.AppendTextBypassReadonly($"{Environment.CurrentDirectory}> {input}\n");

            var args = ParseArgs(input);
            if (args.Length == 0) {
                return;
            }
            var cmd = args[0];

            bool force = cmd == "force";
            if (force) {
                args = args[1..];
                cmd = args[0];
            }

            if (cmd == "clear") {
                outputControl.SetTextBypassReadonly("");
                return;
            }

            if (!Ws2Explorer.Program.CommandWillWrite(cmd)) {
                await program.Run(args, ctsGetter().Token);
                return;
            }

            using (var guard = new TaskGuard(showErrorStatus: false)) {
                if (!guard.Acquired && !force) {
                    outputControl.AppendTextBypassReadonly(
                        "Error: Another write operation is already in progress and \n" +
                        "the current command has been aborted to prevent data corruption. \n" +
                        "Prefix the command with 'force ' to ignore this safeguard.\n"
                        );
                    return;
                }
                await program.Run(args, ctsGetter().Token);
            }
            OnUpdateRequired(this, EventArgs.Empty);
        }

        private static string[] ParseArgs(string input) {
            var parts = new List<string>();
            var part = "";
            bool inQuote = false;
            foreach (var c in input) {
                switch (c) {
                    case ' ' when !inQuote:
                        if (part.Length > 0) {
                            parts.Add(part);
                            part = "";
                        }
                        break;
                    case '"':
                        inQuote = !inQuote;
                        break;
                    default:
                        part += c;
                        break;
                }
            }
            if (part.Length > 0) {
                parts.Add(part);
            }
            return parts.ToArray();
        }
    }

    class TaskGuard : IDisposable {
        private static bool isTaskRunning;
        public bool Acquired { get; }

        public TaskGuard(bool showErrorStatus = true) {
            Acquired = !isTaskRunning;
            isTaskRunning = true;
            if (!Acquired && showErrorStatus) {
                instance.ShowStatus("Wait for the current operation to finish.");
            }
        }

        public void Dispose() {
            if (Acquired) {
                isTaskRunning = false;
            }
        }
    }

    private static MainWindow instance = null!;
    private readonly Config config;
    private readonly CommonOpenFileDialog openFileDialog = new();
    private readonly FormTimer clearStatusTextTimer;
    private readonly Stack<string> folderUndoHistory = new();
    private readonly Stack<string> folderRedoHistory = new();
    private readonly IProgress<(int, string, float)> progress;
    private IFolder? currentFolder;
    private BinaryFile? currentBinaryFile;
    private CancellationTokenSource cts = new();
    private readonly ByteViewer hexPreviewBox;
    private readonly TabPage hexPreviewTab;
    private Size restoredWindowSize;
    private int currentProgressTask;

#if INCLUDE_VIDEO_PLAYER
    private readonly LibVLC vlc;
    private readonly MediaPlayer mediaPlayer;
    private readonly TabPage videoPreviewTab;
    private readonly VideoView videoPreviewBox;
#endif

    public MainWindow(string? openPath) {
        instance = this;
        InitializeComponent();

#if INCLUDE_VIDEO_PLAYER
        Core.Initialize(); // First startup takes a while
        vlc = new LibVLC();
        mediaPlayer = new MediaPlayer(vlc) {
            Mute = true
        };
        videoPreviewBox = new VideoView {
            Dock = DockStyle.Fill,
            MediaPlayer = mediaPlayer,
        };
        videoPreviewTab = new TabPage("Video") {
            Controls = { videoPreviewBox }
        };
        previewerTabControl.TabPages.Add(videoPreviewTab);
#endif

        var currentProcess = Process.GetCurrentProcess();
        var exeDir = currentProcess.MainModule != null ? Path.GetDirectoryName(currentProcess.MainModule.FileName) : "";
        var configPath = Path.Combine(exeDir ?? "", "ws2explorerguiconfig.json");
        config = Config.Load(configPath);

        progress = new Progress<(int id, string task, float value)>(x => {
            if (x.value <= 0) {
                currentProgressTask = x.id;
            } else if (x.id != currentProgressTask) {
                return;
            }
            int v = (int)(x.value * 100);
            if (v >= progressBar.Maximum) {
                taskLabel.Text = "";
                progressBar.Visible = false;
                cancelButton.Visible = false;
            } else {
                taskLabel.Text = x.task;
                progressBar.Visible = true;
                cancelButton.Visible = true;
                progressBar.Value = v + 1;
                progressBar.Value = v;
            }
        });

        clearStatusTextTimer = new FormTimer {
            Interval = 3000,
        };
        clearStatusTextTimer.Tick += (sender, e) => {
            statusLabel.Text = "";
            clearStatusTextTimer.Stop();
        };

        hexPreviewBox = new ByteViewer() {
            Dock = DockStyle.Fill,
        };
        hexPreviewTab = new TabPage("Hex");
        hexPreviewTab.Controls.Add(hexPreviewBox);

        encodingDropDown.Items.AddRange(PrettyNameEncoding.Encodings);
        encodingDropDown.SelectedIndex = 0;

        var terminal = new Terminal(terminalInputTextBox, terminalOutputTextBox, () => cts);
        terminal.OnUpdateRequired += async (_, _) => await ReopenFolder();

        InitScintillaTextBox();

        try {
            Size = new Size(config.WindowWidth, config.WindowHeight);
            restoredWindowSize = Size;
            if (config.WindowMaximized) {
                WindowState = FormWindowState.Maximized;
            } else if (config.WindowX.HasValue && config.WindowY.HasValue) {
                StartPosition = FormStartPosition.Manual;
            }
            if (config.WindowX.HasValue && config.WindowY.HasValue) {
                Location = new Point(config.WindowX.Value, config.WindowY.Value);
            }
            wordWrapMenuItem.Checked = config.WordWrap;
            showEmptyPnaFilesMenuItem.Checked = config.ShowEmptyPnaFiles;
            showHexMenuItem.Checked = config.ShowHexViewer;
            showTerminalMenuItem.Checked = config.ShowTerminal;
            terminalPreviewerSplitContainer.Panel2Collapsed = !config.ShowTerminal;

            // Workaround for split container having 0 size during constructor
            // which would cause the splitter distance setter to throw.
            Task.Run(() => terminalPreviewerSplitContainer.Invoke(() => {
                terminalPreviewerSplitContainer.SplitterDistance = config.PreviewerPanelHeight;
                filePreviewerSplitContainer.SplitterDistance = config.FilePanelWidth;
            }));
        } catch (Exception ex) {
            ShowStatus($"Error loading config: {ex.GetMessage()}");
            config = new Config() { SavePath = config.SavePath };
        }

        try {
            if (openPath != null) {
                _ = OpenFolderFromPath(openPath);
            } else if (config.OpenFolder.Length > 0) {
                _ = OpenFolderFromPath(config.OpenFolder);
            }
        } catch {
            config.OpenFolder = "";
        }

        if (currentFolder == null) {
            try {
                _ = OpenFolderFromPath(Environment.CurrentDirectory);
            } catch { }
        }
    }

    private void InitScintillaTextBox() {
        // https://github.com/robinrodricks/ScintillaNET.Demo/blob/master/ScintillaNET.Demo/MainForm.cs

        static Color IntToColorInvert(int rgb) {
            byte r = (byte)(rgb >> 16);
            byte g = (byte)(rgb >> 8);
            byte b = (byte)rgb;
            return Color.FromArgb(
                255,
                255 - r,
                255 - g,
                255 - b
                );
        }

        textPreviewBox.StyleResetDefault();
        textPreviewBox.Styles[Style.Default].Font = "Consolas";
        textPreviewBox.Styles[Style.Default].Size = 10;
        textPreviewBox.Styles[Style.Default].BackColor = IntToColorInvert(0x000000);
        textPreviewBox.Styles[Style.Default].ForeColor = IntToColorInvert(0xFFFFFF);
        textPreviewBox.Styles[Style.Default].ForeColor = IntToColorInvert(0xFFFFFF);
        textPreviewBox.CaretLineVisible = false;
        textPreviewBox.StyleClearAll();

        textPreviewBox.Styles[Style.Cpp.Identifier].ForeColor = IntToColorInvert(0xD0DAE2);
        textPreviewBox.Styles[Style.Cpp.Comment].ForeColor = IntToColorInvert(0xBD758B);
        textPreviewBox.Styles[Style.Cpp.CommentLine].ForeColor = IntToColorInvert(0x40BF57);
        textPreviewBox.Styles[Style.Cpp.CommentDoc].ForeColor = IntToColorInvert(0x2FAE35);
        textPreviewBox.Styles[Style.Cpp.Number].ForeColor = IntToColorInvert(0xFFFF00);
        textPreviewBox.Styles[Style.Cpp.String].ForeColor = IntToColorInvert(0xFFFF00);
        textPreviewBox.Styles[Style.Cpp.Character].ForeColor = IntToColorInvert(0xE95454);
        textPreviewBox.Styles[Style.Cpp.Preprocessor].ForeColor = IntToColorInvert(0x8AAFEE);
        textPreviewBox.Styles[Style.Cpp.Operator].ForeColor = IntToColorInvert(0xE0E0E0);
        textPreviewBox.Styles[Style.Cpp.Regex].ForeColor = IntToColorInvert(0xff00ff);
        textPreviewBox.Styles[Style.Cpp.CommentLineDoc].ForeColor = IntToColorInvert(0x77A7DB);
        textPreviewBox.Styles[Style.Cpp.Word].ForeColor = IntToColorInvert(0x48A8EE);
        textPreviewBox.Styles[Style.Cpp.Word2].ForeColor = IntToColorInvert(0xF98906);
        textPreviewBox.Styles[Style.Cpp.CommentDocKeyword].ForeColor = IntToColorInvert(0xB3D991);
        textPreviewBox.Styles[Style.Cpp.CommentDocKeywordError].ForeColor = IntToColorInvert(0xFF0000);
        textPreviewBox.Styles[Style.Cpp.GlobalClass].ForeColor = IntToColorInvert(0x48A8EE);

        textPreviewBox.SetKeywords(0, "class extends implements import interface new case do while else if for in switch throw get set function var try catch finally while with default break continue delete return each const namespace package include use is as instanceof typeof author copy default deprecated eventType example exampleText exception haxe inheritDoc internal link mtasc mxmlc param private return see serial serialData serialField since throws usage version langversion playerversion productversion dynamic private public partial static intrinsic internal native override protected AS3 final super this arguments null Infinity NaN undefined true false abstract as base bool break by byte case catch char checked class const continue decimal default delegate do double descending explicit event extern else enum false finally fixed float for foreach from goto group if implicit in int interface internal into is lock long new null namespace object operator out override orderby params private protected public readonly ref return switch struct sbyte sealed short sizeof stackalloc static string select this throw true try typeof uint ulong unchecked unsafe ushort using var virtual volatile void while where yield");
        textPreviewBox.SetKeywords(1, "void Null ArgumentError arguments Array Boolean Class Date DefinitionError Error EvalError Function int Math Namespace Number Object RangeError ReferenceError RegExp SecurityError String SyntaxError TypeError uint XML XMLList Boolean Byte Char DateTime Decimal Double Int16 Int32 Int64 IntPtr SByte Single UInt16 UInt32 UInt64 UIntPtr Void Path File System Windows Forms ScintillaNET");

        textPreviewBox.CaretLineVisible = false;

        terminalOutputTextBox.Styles[Style.Default].Font = "Consolas";
        terminalOutputTextBox.Styles[Style.Default].Size = 10;
        terminalOutputTextBox.CaretLineVisible = false;
    }

    private async void MenuFileOpenFileClicked(object sender, EventArgs e) {
        openFileDialog.IsFolderPicker = false;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok) {
            await OpenFolderFromPath(openFileDialog.FileName);
        }
    }

    private async void MenuFileOpenFolderClicked(object sender, EventArgs e) {
        openFileDialog.IsFolderPicker = true;
        if (openFileDialog.ShowDialog() == CommonFileDialogResult.Ok) {
            await OpenFolderFromPath(openFileDialog.FileName);
        }
    }

    private async Task OpenFolderFromPath(string path, bool modifyHistory = true) {
        IFolder folder;
        try {
            folder = await Folder.GetFolder(path, cts.Token, progress);
        } catch (Exception ex) {
            ShowErrorMessageBox($"Cannot open folder '{path}': {ex.GetMessage()}");
            return;
        }

        OpenFolder(folder, modifyHistory);
    }

    private void OpenFolder(IFolder folder, bool modifyHistory = true) {
        List<FileMetadata> children;
        try {
            children = folder.ListChildren();
        } catch (Exception ex) {
            ShowErrorMessageBox($"Cannot list folder '{folder.FullPath}': {ex.GetMessage()}");
            return;
        }

        if (modifyHistory) {
            folderUndoHistory.TryPeek(out var nextUndo);
            if (currentFolder != null && nextUndo != currentFolder.FullPath) {
                folderUndoHistory.Push(currentFolder.FullPath);
            }
            folderRedoHistory.Clear();
        }

        currentFolder = folder;

        var fullPath = folder.FullPath;
        SetPathTextBoxText(fullPath);
        config.OpenFolder = fullPath;

        fileListView.Items.Clear();
        FileListViewIndexChanged(this, EventArgs.Empty);

        fileListView.BeginUpdate();
        try {
            if (currentFolder.Parent != null) {
                fileListView.Items.Add(new ListViewItem(new[] {
                    "..",
                    "",
                }));
            }

            children.Sort((a, b) => {
                if (a.IsFolder != b.IsFolder) {
                    return a.IsFolder ? -1 : 1;
                }

                var extA = Path.GetExtension(a.Name);
                var extB = Path.GetExtension(b.Name);
                if (extA != extB) {
                    return string.Compare(extA, extB, StringComparison.OrdinalIgnoreCase);
                }

                return string.Compare(a.Name, b.Name, StringComparison.OrdinalIgnoreCase);
            });

            foreach (var child in children) {
                if (folder is PnaFile && child.Length == 0 && !showEmptyPnaFilesMenuItem.Checked) {
                    continue;
                }
                fileListView.Items.Add(new ListViewItem(new[] {
                    child.Name + (child.IsFolder ? "/" : ""),
                    child.Length.ToString() ?? "",
                }));
            }
        } finally {
            fileListView.EndUpdate();
        }
    }

    private async void FileListViewDoubleClicked(object sender, EventArgs e) {
        var currentFolder = this.currentFolder;

        if (currentFolder == null) {
            return;
        }

        if (IsParentFolderSelected()) {
            if (currentFolder.Parent != null) {
                OpenFolder(currentFolder.Parent);
            }
            return;
        }

        var selectedFilenames = GetSelectedFilenames();
        if (selectedFilenames.Length == 0) {
            return;
        }
        var selectedFilename = selectedFilenames[0];

        IFile file;
        try {
            file = await currentFolder.GetChild(selectedFilename, cts.Token, progress);
        } catch (Exception ex) {
            ShowErrorMessageBox($"Cannot open '{selectedFilename}': {ex.GetMessage()}");
            return;
        }

        if (file is not IFolder folder) {
            ShowStatus($"Cannot open '{selectedFilename}': Not a folder");
            return;
        }

        OpenFolder(folder);
    }

    private void ShowStatus(string text) {
        statusLabel.Text = text;
        clearStatusTextTimer.Stop();
        clearStatusTextTimer.Start();
    }

    public static void ShowErrorMessageBox(string text) {
        MessageBox.Show(text, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
    }

    private async Task ReopenFolder() {
        if (currentFolder != null) {
            await OpenFolderFromPath(currentFolder.FullPath, false);
        }
        if (currentBinaryFile != null) {
            try {
                currentBinaryFile = await Folder.GetFile(
                    ((IFile)currentBinaryFile).FullPath,
                    cts.Token,
                    progress
                    ) as BinaryFile;
                if (currentBinaryFile != null) {
                    await OpenBinaryFile(currentBinaryFile);
                }
            } catch { }
        }
    }

    private async void MenuFileExportClicked(object sender, EventArgs e) {
        if (currentFolder == null) {
            ShowStatus("No file selected to export");
            return;
        }

        using var guard = new TaskGuard();
        if (!guard.Acquired) {
            return;
        }

        var binaryFiles = new List<BinaryFile>();
        try {
            var files = await GetSelectedFiles(currentFolder);
            if (files.Length == 0) {
                ShowStatus("No file selected to export");
                return;
            }

            foreach (var file in files) {
                if (file is not BinaryFile binaryFile) {
                    ShowErrorMessageBox($"Cannot export '{file.Name}': Not a regular file");
                    return;
                }
                binaryFiles.Add(binaryFile);
            }
        } catch (Exception ex) {
            ShowErrorMessageBox($"Cannot export: {ex.GetMessage()}");
            return;
        }

        string[] destinations;
        if (binaryFiles.Count > 1) {
            openFileDialog.IsFolderPicker = true;
            if (openFileDialog.ShowDialog() != CommonFileDialogResult.Ok) {
                return;
            }
            destinations = binaryFiles
                .Select(x => Path.Combine(openFileDialog.FileName, x.Name))
                .ToArray();
        } else {
            var ext = Path.GetExtension(binaryFiles[0].Name);
            var filter = string.IsNullOrEmpty(ext)
                ? new CommonFileDialogFilter("All files", "*")
                : new CommonFileDialogFilter($"{ext} file", $"*{ext}");
            using var saveFileDialog = new CommonSaveFileDialog();
            saveFileDialog.Filters.Add(filter);
            saveFileDialog.DefaultFileName = binaryFiles[0].Name;
            if (saveFileDialog.ShowDialog() != CommonFileDialogResult.Ok) {
                return;
            }
            destinations = new[] { saveFileDialog.FileName };
        }

        try {
            foreach (var (file, dst) in binaryFiles.Zip(destinations)) {
                await using var dstFile = File.Create(dst);
                await file.Stream.CopyToAsync(dstFile, cts.Token);
            }
        } catch (Exception ex) {
            ShowErrorMessageBox($"Cannot export: {ex.GetMessage()}");
        }
    }

    private bool IsParentFolderSelected() {
        return fileListView.SelectedItems.Count == 1 && fileListView.SelectedItems[0].Text == "..";
    }

    private string[] GetSelectedFilenames() {
        return fileListView.SelectedItems
            .Cast<ListViewItem>()
            .Select(x => x.Text.TrimEnd('/'))
            .Where(x => x != "..")
            .ToArray();
    }

    private async Task<IFile[]> GetSelectedFiles(IFolder folder) {
        var files = new List<IFile>();
        foreach (var filename in GetSelectedFilenames()) {
            files.Add(await folder.GetChild(filename, cts.Token, progress));
        }
        return files.ToArray();
    }

    private async Task OpenBinaryFile(BinaryFile file) {
        currentBinaryFile = file;

        imagePreviewBox.Image = null;
#if INCLUDE_VIDEO_PLAYER
        mediaPlayer.Media = null;
#endif
        textPreviewBox.SetTextBypassReadonly("");

        if (file is Ws2File ws2) {
            fileInfoLabel.Text = $"WS2 ({ws2.Ws2Version.ToString().Replace('_', '.')})";
        } else if (file is ImageFile imageFile) {
            fileInfoLabel.Text = $"{imageFile.ImageType} ({imageFile.Image.Width}x{imageFile.Image.Height})";
        } else if (file.IsText) {
            fileInfoLabel.Text = "TEXT";
        } else {
            var fileTypeName = file.GetType().Name;
            fileInfoLabel.Text = (fileTypeName.EndsWith("File") ? fileTypeName[..^4] : fileTypeName).ToUpper();
        }

        await Task.Yield();
        bool shown = true;
        if (file is ImageFile image) {
            imagePreviewBox.Image = image.Image;
            await Task.Yield();
            previewerTabControl.SelectedTab = imagePreviewTab;
#if INCLUDE_VIDEO_PLAYER
        } else if (file is VideoFile video) {
            video.Stream.Reset();
            mediaPlayer.Play(new Media(vlc, new StreamMediaInput(video.Stream.MemoryStream)));
            await Task.Yield();
            previewerTabControl.SelectedTab = videoPreviewTab;
#endif
        } else if (currentBinaryFile.IsText) {
            if (encodingDropDown.SelectedItem == currentBinaryFile.SuggestedEncoding) {
                textPreviewBox.SetTextBypassReadonly(currentBinaryFile.GetText(currentBinaryFile.SuggestedEncoding!));
            } else {
                // Auto sets text as well
                encodingDropDown.SelectedItem = currentBinaryFile.SuggestedEncoding;
            }
            await Task.Yield();
            previewerTabControl.SelectedTab = textPreviewTab;
        } else if (showHexMenuItem.Checked) {
            previewerTabControl.SelectedTab = hexPreviewTab;
        } else {
            shown = false;
        }

        if (shown) {
            previewerTabControl.Visible = true;
        }

        if (showHexMenuItem.Checked) {
            await Task.Yield();
            hexPreviewBox.SetBytes(currentBinaryFile.Stream.MemoryStream.ToArray());
        }

        fileListView.Focus();
    }

    private async void FileListViewIndexChanged(object sender, EventArgs e) {
        var selectedFilenames = GetSelectedFilenames();
        if (selectedFilenames.Length != 1 || currentFolder == null) {
            return;
        }
        var selectedFilename = selectedFilenames[0];

        IFile file;
        try {
            file = await currentFolder.GetChild(selectedFilename, cts.Token, progress);
        } catch (Exception ex) {
            ShowStatus($"Cannot open '{selectedFilename}': {ex.GetMessage()}");
            return;
        }

        if (file is not BinaryFile binaryFile) {
            currentBinaryFile = null;
            fileInfoLabel.Text = "";
            previewerTabControl.Visible = false;
            return;
        }

        await OpenBinaryFile(binaryFile);
    }

    private async void MenuViewShowEmptyPnaChecked(object sender, EventArgs e) {
        await ReopenFolder();
    }

    private static bool ShowConfirmationPrompt(string text, MessageBoxIcon icon) {
        return MessageBox.Show(text, "Confirmation", MessageBoxButtons.YesNo, icon) == DialogResult.Yes;
    }

    private static bool ShowConfirmationPrompt(string text) {
        return ShowConfirmationPrompt(text, MessageBoxIcon.Question);
    }

    private async void PathTextBoxKeyDown(object sender, KeyEventArgs e) {
        if (e.KeyCode == Keys.Enter) {
            await OpenFolderFromPath(pathTextBox.Text);
        }
    }

    private void FileListViewKeyDown(object sender, KeyEventArgs e) {
        if (e.KeyCode == Keys.Enter) {
            FileListViewDoubleClicked(sender, EventArgs.Empty);
            return;
        }

        if (e.KeyCode == Keys.Back) {
            MenuViewGoToParentClicked(sender, EventArgs.Empty);
            return;
        }
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData) {
        if (keyData == (Keys.Control | Keys.C) && fileListView.Focused) {
            CopyToClipboard();
            return true;
        }

        if (keyData == (Keys.Control | Keys.V) && fileListView.Focused) {
            _ = PasteFromClipboard();
            return true;
        }

        if (keyData == Keys.Tab && pathTextBox.SelectionStart == pathTextBox.Text.Length) {
            async void RunAsync() {
                if (pathTextBox.Focused) {
                    var autocompleted = await AutocompletePath(pathTextBox.Text);
                    if (autocompleted != null) {
                        SetPathTextBoxText(autocompleted);
                    }
                    return;
                }

                if (terminalInputTextBox.Focused) {
                    var text = terminalInputTextBox.Text;
                    var caretIndex = terminalInputTextBox.SelectionStart;
                    var spaceIndexLeft = text.LastIndexOf(' ', caretIndex - 1);
                    var spaceIndexRight = text.IndexOf(' ', caretIndex);
                    spaceIndexRight = spaceIndexRight == -1 ? text.Length : spaceIndexRight;
                    var path = text[(spaceIndexLeft + 1)..spaceIndexRight];
                    var autocompleted = await AutocompletePath(path);
                    if (autocompleted != null) {
                        terminalInputTextBox.Text = text[..(spaceIndexLeft + 1)] + autocompleted + text[spaceIndexRight..];
                        terminalInputTextBox.SelectionStart = spaceIndexLeft + 1 + autocompleted.Length;
                    }
                }
            }
            RunAsync();
            return true;
        }

        return base.ProcessCmdKey(ref msg, keyData);
    }

    private async Task<string?> AutocompletePath(string path) {
        var splitIndex = path.LastIndexOfAny(new[] { '\\', '/' });
        if (splitIndex == -1) {
            return null;
        }
        var folderName = path[..splitIndex];
        var filename = path[(splitIndex + 1)..];

        string[] children;
        try {
            var folder = await Folder.GetFolder(folderName, cts.Token, progress);
            children = folder.ListChildren()
                .Select(x => x.Name)
                .ToArray();
        } catch (Exception ex) {
            ShowStatus($"Cannot list folder '{folderName}': {ex.GetMessage()}");
            return null;
        }

        var candidates = children
            .Where(x => x.StartsWith(filename, StringComparison.OrdinalIgnoreCase))
            .ToArray();

        string result;
        if (candidates.Length == 1 && candidates[0] == filename) {
            result = path + "/";
        } else if (candidates.Length > 0) {
            result = Path.Combine(folderName, candidates[0]);
        } else {
            return null;
        }

        return result.Replace('\\', '/');
    }

    private void SetPathTextBoxText(string text) {
        pathTextBox.Text = text.Replace('\\', '/');
        pathTextBox.SelectionStart = text.Length;
    }

    private async void MenuEditSwapFileClicked(object sender, EventArgs e) {
        var currentFolder = this.currentFolder;
        if (currentFolder == null) {
            ShowStatus("Select two files to swap");
            return;
        }

        var selectedFilenames = GetSelectedFilenames();
        if (selectedFilenames.Length != 2) {
            ShowStatus("Select two files to swap");
            return;
        }

        using (var guard = new TaskGuard()) {
            if (!guard.Acquired) {
                return;
            }

            var a = selectedFilenames[0];
            var b = selectedFilenames[1];
            try {
                await currentFolder.SwapChildren(a, b, cts.Token, progress);
            } catch (Exception ex) {
                ShowErrorMessageBox($"Cannot swap '{a}' <-> '{b}': {ex.GetMessage()}");
            }
        }

        await ReopenFolder();
    }

    private void CancelButtonClicked(object sender, EventArgs e) {
        if (ShowConfirmationPrompt("Cancel current operation?\nCancelling may leave corrupt files.", MessageBoxIcon.Warning)) {
            cts.Cancel();
            cts = new CancellationTokenSource();
        }
    }

    private async void MenuEditOpenAsHexClicked(object sender, EventArgs e) {
        await OpenExternalEditor("Hex", config.HexEditorPath);
    }

    private async void MenuEditOpenInAppClicked(object sender, EventArgs e) {
        if (currentBinaryFile == null) {
            ShowStatus("Select a file to open");
            return;
        }

        if (currentBinaryFile is ImageFile) {
            await OpenExternalEditor("Image", config.ImageEditorPath);
        } else if (currentBinaryFile.IsText) {
            await OpenExternalEditor("Text", config.TextEditorPath);
        } else {
            await OpenExternalEditor("Hex", config.HexEditorPath);
        }
    }

    private async Task OpenExternalEditor(string editorType, string editorPath) {
        var currentFolder = this.currentFolder;
        var currentBinaryFile = this.currentBinaryFile;
        if (currentFolder == null || currentBinaryFile == null) {
            ShowStatus("Select a file to open");
            return;
        }

        var guard = new TaskGuard();
        if (!guard.Acquired) {
            // Don't need to dispose guard because it's not acquired
            return;
        }

        string? targetFilename = null;
        try {
            var currentBinaryFileFullPath = ((IFile)currentBinaryFile).FullPath;
            if (currentBinaryFile.IsRealFile) {
                targetFilename = currentBinaryFileFullPath;
            } else {
                try {
                    var ext = Path.GetExtension(currentBinaryFileFullPath);
                    targetFilename = Path.GetTempFileName() + ext;
                    await using var tempFileStream = File.Create(targetFilename);
                    await currentBinaryFile.Stream.CopyToAsync(tempFileStream, cts.Token);
                } catch (Exception ex) {
                    ShowErrorMessageBox($"Cannot export '{currentBinaryFile.Name}' for editing: {ex.GetMessage()}");
                    return;
                }
            }

            if (editorPath.Length == 0) {
                ShowStatus("No editor set for media type: " + editorType);
                return;
            }

            try {
                Process proc = Process.Start(editorPath, $"\"{targetFilename}\"");

                await proc.WaitForExitAsync(cts.Token);

                if (!currentBinaryFile.IsRealFile) {
                    var newData = await File.ReadAllBytesAsync(targetFilename, cts.Token);

                    if (newData.Length == currentBinaryFile.Stream.Length &&
                        newData.SequenceEqual(currentBinaryFile.Stream.MemoryStream.ToArray()))
                    {
                        ShowStatus("No changes made");
                        return;
                    }

                    await currentFolder.CopyFiles(
                        new[] { targetFilename },
                        new[] { currentBinaryFile.Name },
                        _ => true,
                        cts.Token,
                        progress
                    );
                    ShowStatus("Changes applied");
                }
            } catch (Exception ex) {
                ShowErrorMessageBox($"Copy failed for '{targetFilename}': {ex.GetMessage()}");
            }
        } finally {
            if (!currentBinaryFile.IsRealFile && targetFilename != null) {
                try {
                    File.Delete(targetFilename);
                } catch { }
            }
            guard.Dispose();
        }

        await ReopenFolder();
    }

    private void EncodingDropDownIndexChanged(object sender, EventArgs e) {
        var encoding = (Encoding?)encodingDropDown.SelectedItem;
        if (encoding == null) {
            return;
        }

        if (currentBinaryFile == null) {
            return;
        }

        if (currentBinaryFile.Stream.Length > BinaryFile.MAX_TEXT_SIZE) {
            ShowStatus("File too large to preview as text");
            return;
        }

        textPreviewBox.SetTextBypassReadonly(currentBinaryFile.GetText(encoding));
    }

    private void MenuFileExitClicked(object sender, EventArgs e) {
        Close();
    }

    private async void MenuEditDeleteClicked(object sender, EventArgs e) {
        var selectedFilenames = GetSelectedFilenames();
        if (selectedFilenames.Length == 0 || currentFolder == null) {
            ShowStatus("Select files to delete");
            return;
        }

        if (selectedFilenames.Length == 1) {
            if (!ShowConfirmationPrompt($"Delete {selectedFilenames[0]}?")) {
                return;
            }
        } else {
            if (!ShowConfirmationPrompt($"Delete {selectedFilenames.Length} files?")) {
                return;
            }
        }

        using (var guard = new TaskGuard()) {
            if (!guard.Acquired) {
                return;
            }

            try {
                await currentFolder.DeleteChildren(selectedFilenames, cts.Token, progress);
            } catch (Exception ex) {
                ShowErrorMessageBox($"Cannot delete files: {ex.GetMessage()}");
            }
        }

        await ReopenFolder();
    }

    private void MenuEditCopyClicked(object sender, EventArgs e) {
        CopyToClipboard();
    }

    private void CopyToClipboard() {
        if (currentFolder == null) {
            ShowStatus("Select files to copy");
            return;
        }

        var selectedFilenames = new StringCollection();
        selectedFilenames.AddRange(
            GetSelectedFilenames()
                .Select(x => Path.Combine(currentFolder.FullPath, x).Replace('\\', '/'))
                .ToArray()
            );

        if (selectedFilenames.Count == 0) {
            ShowStatus("Select files to copy");
            return;
        }

        try {
            Clipboard.SetFileDropList(selectedFilenames);
        } catch (ExternalException ex) {
            ShowErrorMessageBox($"Cannot copy to clipboard: {ex.GetMessage()}");
        }
    }

    private async void MenuEditPasteClicked(object sender, EventArgs e) {
        await PasteFromClipboard();
    }

    private async Task PasteFromClipboard() {
        if (currentFolder == null) {
            ShowStatus("No folder open");
            return;
        }

        string[] filenames;
        try {
            filenames = Clipboard.GetFileDropList()
                .Cast<string>()
                .ToArray();
        } catch (ExternalException ex) {
            ShowErrorMessageBox($"Cannot paste from clipboard: {ex.GetMessage()}");
            return;
        }

        if (filenames.Length == 0) {
            ShowStatus("No files to paste");
            return;
        }

        using (var guard = new TaskGuard()) {
            if (!guard.Acquired) {
                return;
            }

            try {
                var destinations = filenames
                    .Select(x => Path.GetFileName(x))
                    .ToArray();
                await currentFolder.CopyFiles(filenames, destinations, ShowConfirmationPrompt, cts.Token, progress);
            } catch (Exception ex) {
                ShowErrorMessageBox($"Paste failed: {ex.GetMessage()}");
            }
        }

        await ReopenFolder();
    }

    private async void MenuEditRenameClicked(object sender, EventArgs e) {
        if (currentFolder == null) {
            ShowStatus("No folder open");
            return;
        }
        if (!currentFolder.CanRenameChildren) {
            ShowStatus("This folder type does not support renaming files");
            return;
        }

        using (var guard = new TaskGuard()) {
            if (!guard.Acquired) {
                return;
            }

            var selectedFilenames = GetSelectedFilenames();
            if (selectedFilenames.Length != 1) {
                ShowStatus("Select a single file to rename");
                return;
            }

            var oldName = selectedFilenames[0];
            using var dialog = new RenameWindow(oldName);
            dialog.ShowDialog();
            if (dialog.NewName == null) {
                return;
            }

            try {
                await currentFolder.RenameChild(oldName, dialog.NewName, cts.Token, progress);
            } catch (Exception ex) {
                ShowErrorMessageBox($"Cannot rename '{oldName}' -> '{dialog.NewName}': {ex.GetMessage()}");
            }
        }

        await ReopenFolder();
    }

    private async void MenuViewRefreshClicked(object sender, EventArgs e) {
        await ReopenFolder();
    }

    private void MenuViewGoToParentClicked(object sender, EventArgs e) {
        if (currentFolder?.Parent != null) {
            OpenFolder(currentFolder.Parent);
        }
    }

    private async void MenuViewGoBackClicked(object sender, EventArgs e) {
        if (folderUndoHistory.Count > 0) {
            if (currentFolder != null) {
                folderRedoHistory.Push(currentFolder.FullPath);
            }
            await OpenFolderFromPath(folderUndoHistory.Pop(), false);
        }
    }

    private async void MenuViewGoForwardClicked(object sender, EventArgs e) {
        if (folderUndoHistory.Count > 0) {
            if (currentFolder != null) {
                folderRedoHistory.Push(currentFolder.FullPath);
            }
            await OpenFolderFromPath(folderUndoHistory.Pop(), false);
        }
    }

    private void MenuViewWordWrapClicked(object sender, EventArgs e) {
        textPreviewBox.WrapMode = wordWrapMenuItem.Checked
            ? WrapMode.Word
            : WrapMode.None;
    }

    private async void MenuViewShowEmptyPNAFilesClicked(object sender, EventArgs e) {
        await ReopenFolder();
    }

    private async void MenuViewShowHexChecked(object sender, EventArgs e) {
        config.ShowHexViewer = showHexMenuItem.Checked;
        if (showHexMenuItem.Checked) {
            previewerTabControl.TabPages.Add(hexPreviewTab);
        } else {
            previewerTabControl.TabPages.Remove(hexPreviewTab);
        }
        await ReopenFolder();
    }

    private void MenuFileRevealInExplorerClicked(object sender, EventArgs e) {
        if (currentFolder == null) {
            ShowStatus("No folder open");
            return;
        }

        var filenames = GetSelectedFilenames()
            .Select(x => Path.Combine(currentFolder.FullPath, x).Replace('\\', '/'))
            .ToArray();

        string path;
        if (filenames.Length == 0) {
            path = currentFolder.FullPath;
        } else {
            path = filenames[0];
        }
        path = path.Replace('/', '\\');

        try {
            Process.Start("explorer.exe", $"/select, \"{path}\"");
        } catch (Exception ex) {
            ShowStatus($"Cannot reveal in explorer: {ex.GetMessage()}");
        }
    }

    private void MenuEditCopyPathClicked(object sender, EventArgs e) {
        if (currentFolder == null) {
            ShowStatus("No folder open");
            return;
        }

        var filenames = GetSelectedFilenames()
            .Select(x => Path.Combine(currentFolder.FullPath, x).Replace('\\', '/'))
            .ToArray();

        string text;
        if (filenames.Length == 0) {
            text = currentFolder.FullPath;
        } else if (filenames.Length == 1) {
            text = filenames[0];
        } else {
            text = string.Join(' ', filenames.Select(x => $"\"{x}\""));
        }

        try {
            Clipboard.SetText(text);
        } catch (ExternalException ex) {
            ShowErrorMessageBox($"Cannot copy to clipboard: {ex.GetMessage()}");
        }
    }

    private void MenuViewShowTerminalCheckChanged(object sender, EventArgs e) {
        terminalPreviewerSplitContainer.Panel2Collapsed = !showTerminalMenuItem.Checked;
    }

    private void MenuFileSetExternalEditorPathsClicked(object sender, EventArgs e) {
        using var dialog = new ExternalEditorPathWindow(config);
        if (dialog.ShowDialog() == DialogResult.OK) {
            config.TextEditorPath = dialog.TextEditorPath;
            config.ImageEditorPath = dialog.ImageEditorPath;
            config.HexEditorPath = dialog.HexEditorPath;
        }
    }

    private void OnFormClosing(object sender, FormClosingEventArgs e) {
        config.ShowEmptyPnaFiles = showEmptyPnaFilesMenuItem.Checked;
        config.ShowHexViewer = showHexMenuItem.Checked;
        config.ShowTerminal = showTerminalMenuItem.Checked;
        config.WordWrap = wordWrapMenuItem.Checked;
        config.FilePanelWidth = filePreviewerSplitContainer.SplitterDistance;
        config.PreviewerPanelHeight = terminalPreviewerSplitContainer.SplitterDistance;
        config.WindowX = Location.X;
        config.WindowY = Location.Y;
        config.WindowWidth = restoredWindowSize.Width;
        config.WindowHeight = restoredWindowSize.Height;
        config.WindowMaximized = WindowState == FormWindowState.Maximized;
        config.Save();
    }

    private void OnFormResized(object sender, EventArgs e) {
        if (WindowState == FormWindowState.Normal) {
            restoredWindowSize = Size;
        }
    }
}

static class Extensions {
    public static string GetMessage(this Exception ex) {
        return $"({ex.GetType().Name}) {ex.Message}";
    }

    public static void AppendTextBypassReadonly(this Scintilla scintilla, string text) {
        scintilla.ReadOnly = false;
        scintilla.AppendText(text);
        scintilla.GotoPosition(scintilla.TextLength);
        scintilla.ScrollCaret();
        scintilla.ReadOnly = true;
    }

    public static void SetTextBypassReadonly(this Scintilla scintilla, string text) {
        scintilla.ReadOnly = false;
        scintilla.Text = text;
        scintilla.ReadOnly = true;
    }
}
