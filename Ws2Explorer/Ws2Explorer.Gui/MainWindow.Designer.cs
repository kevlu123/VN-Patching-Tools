namespace Ws2Explorer.Gui;

partial class MainWindow {
    /// <summary>
    ///  Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    ///  Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing) {
        if (disposing && (components != null)) {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    ///  Required method for Designer support - do not modify
    ///  the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent() {
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainWindow));
        menuStrip = new MenuStrip();
        fileToolStripMenuItem = new ToolStripMenuItem();
        openToolStripMenuItem = new ToolStripMenuItem();
        openFolderToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator1 = new ToolStripSeparator();
        toolStripMenuItem1 = new ToolStripMenuItem();
        exportToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator2 = new ToolStripSeparator();
        preferencesToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator5 = new ToolStripSeparator();
        exitToolStripMenuItem = new ToolStripMenuItem();
        editToolStripMenuItem = new ToolStripMenuItem();
        editInApplicationToolStripMenuItem = new ToolStripMenuItem();
        editHexToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator4 = new ToolStripSeparator();
        copyFullPathToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator10 = new ToolStripSeparator();
        renameToolStripMenuItem = new ToolStripMenuItem();
        deleteToolStripMenuItem = new ToolStripMenuItem();
        swapFilesToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator3 = new ToolStripSeparator();
        copyToolStripMenuItem = new ToolStripMenuItem();
        pasteToolStripMenuItem = new ToolStripMenuItem();
        viewToolStripMenuItem = new ToolStripMenuItem();
        refreshToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator6 = new ToolStripSeparator();
        goToParentToolStripMenuItem = new ToolStripMenuItem();
        goBackToolStripMenuItem = new ToolStripMenuItem();
        goForwardToolStripMenuItem = new ToolStripMenuItem();
        toolStripSeparator8 = new ToolStripSeparator();
        wordWrapMenuItem = new ToolStripMenuItem();
        toolStripSeparator7 = new ToolStripSeparator();
        showEmptyPnaFilesMenuItem = new ToolStripMenuItem();
        showHexMenuItem = new ToolStripMenuItem();
        showTerminalMenuItem = new ToolStripMenuItem();
        fileListView = new ListView();
        fileListViewNameColumn = new ColumnHeader();
        fileListViewSizeColumn = new ColumnHeader();
        fileListViewCrc32Column = new ColumnHeader();
        statusStrip = new StatusStrip();
        statusLabel = new ToolStripStatusLabel();
        fillerLabel = new ToolStripStatusLabel();
        taskLabel = new ToolStripStatusLabel();
        progressBar = new ToolStripProgressBar();
        cancelButton = new ToolStripDropDownButton();
        fileInfoLabel = new ToolStripStatusLabel();
        filePreviewerSplitContainer = new SplitContainer();
        panel1 = new Panel();
        pathTextBox = new TextBox();
        terminalPreviewerSplitContainer = new SplitContainer();
        previewerTabControl = new TabControl();
        textPreviewTab = new TabPage();
        textPreviewBox = new ScintillaNET.Scintilla();
        panel2 = new Panel();
        panel3 = new Panel();
        encodingDropDown = new ComboBox();
        label1 = new Label();
        imagePreviewTab = new TabPage();
        imagePreviewBox = new PictureBox();
        panel4 = new Panel();
        terminalOutputTextBox = new ScintillaNET.Scintilla();
        panel5 = new Panel();
        terminalInputTextBox = new TextBox();
        menuStrip.SuspendLayout();
        statusStrip.SuspendLayout();
        ((System.ComponentModel.ISupportInitialize)filePreviewerSplitContainer).BeginInit();
        filePreviewerSplitContainer.Panel1.SuspendLayout();
        filePreviewerSplitContainer.Panel2.SuspendLayout();
        filePreviewerSplitContainer.SuspendLayout();
        ((System.ComponentModel.ISupportInitialize)terminalPreviewerSplitContainer).BeginInit();
        terminalPreviewerSplitContainer.Panel1.SuspendLayout();
        terminalPreviewerSplitContainer.Panel2.SuspendLayout();
        terminalPreviewerSplitContainer.SuspendLayout();
        previewerTabControl.SuspendLayout();
        textPreviewTab.SuspendLayout();
        panel3.SuspendLayout();
        imagePreviewTab.SuspendLayout();
        ((System.ComponentModel.ISupportInitialize)imagePreviewBox).BeginInit();
        panel4.SuspendLayout();
        SuspendLayout();
        // 
        // menuStrip
        // 
        menuStrip.Items.AddRange(new ToolStripItem[] { fileToolStripMenuItem, editToolStripMenuItem, viewToolStripMenuItem });
        menuStrip.Location = new Point(0, 0);
        menuStrip.Name = "menuStrip";
        menuStrip.Size = new Size(800, 24);
        menuStrip.TabIndex = 0;
        menuStrip.Text = "menuStrip1";
        // 
        // fileToolStripMenuItem
        // 
        fileToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { openToolStripMenuItem, openFolderToolStripMenuItem, toolStripSeparator1, toolStripMenuItem1, exportToolStripMenuItem, toolStripSeparator2, preferencesToolStripMenuItem, toolStripSeparator5, exitToolStripMenuItem });
        fileToolStripMenuItem.Name = "fileToolStripMenuItem";
        fileToolStripMenuItem.Size = new Size(37, 20);
        fileToolStripMenuItem.Text = "File";
        // 
        // openToolStripMenuItem
        // 
        openToolStripMenuItem.Name = "openToolStripMenuItem";
        openToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.O;
        openToolStripMenuItem.Size = new Size(229, 22);
        openToolStripMenuItem.Text = "Open...";
        openToolStripMenuItem.Click += MenuFileOpenFileClicked;
        // 
        // openFolderToolStripMenuItem
        // 
        openFolderToolStripMenuItem.Name = "openFolderToolStripMenuItem";
        openFolderToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.O;
        openFolderToolStripMenuItem.Size = new Size(229, 22);
        openFolderToolStripMenuItem.Text = "Open Folder...";
        openFolderToolStripMenuItem.Click += MenuFileOpenFolderClicked;
        // 
        // toolStripSeparator1
        // 
        toolStripSeparator1.Name = "toolStripSeparator1";
        toolStripSeparator1.Size = new Size(226, 6);
        // 
        // toolStripMenuItem1
        // 
        toolStripMenuItem1.Name = "toolStripMenuItem1";
        toolStripMenuItem1.ShortcutKeys = Keys.Control | Keys.R;
        toolStripMenuItem1.Size = new Size(229, 22);
        toolStripMenuItem1.Text = "Reveal In File Explorer";
        toolStripMenuItem1.Click += MenuFileRevealInExplorerClicked;
        // 
        // exportToolStripMenuItem
        // 
        exportToolStripMenuItem.Name = "exportToolStripMenuItem";
        exportToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.S;
        exportToolStripMenuItem.Size = new Size(229, 22);
        exportToolStripMenuItem.Text = "Export...";
        exportToolStripMenuItem.Click += MenuFileExportClicked;
        // 
        // toolStripSeparator2
        // 
        toolStripSeparator2.Name = "toolStripSeparator2";
        toolStripSeparator2.Size = new Size(226, 6);
        // 
        // preferencesToolStripMenuItem
        // 
        preferencesToolStripMenuItem.Name = "preferencesToolStripMenuItem";
        preferencesToolStripMenuItem.ShortcutKeys = Keys.F4;
        preferencesToolStripMenuItem.Size = new Size(229, 22);
        preferencesToolStripMenuItem.Text = "Set External Editor Paths...";
        preferencesToolStripMenuItem.Click += MenuFileSetExternalEditorPathsClicked;
        // 
        // toolStripSeparator5
        // 
        toolStripSeparator5.Name = "toolStripSeparator5";
        toolStripSeparator5.Size = new Size(226, 6);
        // 
        // exitToolStripMenuItem
        // 
        exitToolStripMenuItem.Name = "exitToolStripMenuItem";
        exitToolStripMenuItem.ShortcutKeys = Keys.Alt | Keys.F4;
        exitToolStripMenuItem.Size = new Size(229, 22);
        exitToolStripMenuItem.Text = "Exit";
        exitToolStripMenuItem.Click += MenuFileExitClicked;
        // 
        // editToolStripMenuItem
        // 
        editToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { editInApplicationToolStripMenuItem, editHexToolStripMenuItem, toolStripSeparator4, copyFullPathToolStripMenuItem, toolStripSeparator10, renameToolStripMenuItem, deleteToolStripMenuItem, swapFilesToolStripMenuItem, toolStripSeparator3, copyToolStripMenuItem, pasteToolStripMenuItem });
        editToolStripMenuItem.Name = "editToolStripMenuItem";
        editToolStripMenuItem.Size = new Size(39, 20);
        editToolStripMenuItem.Text = "Edit";
        // 
        // editInApplicationToolStripMenuItem
        // 
        editInApplicationToolStripMenuItem.Name = "editInApplicationToolStripMenuItem";
        editInApplicationToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.E;
        editInApplicationToolStripMenuItem.Size = new Size(225, 22);
        editInApplicationToolStripMenuItem.Text = "Edit In Application...";
        editInApplicationToolStripMenuItem.Click += MenuEditOpenInAppClicked;
        // 
        // editHexToolStripMenuItem
        // 
        editHexToolStripMenuItem.Name = "editHexToolStripMenuItem";
        editHexToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.E;
        editHexToolStripMenuItem.Size = new Size(225, 22);
        editHexToolStripMenuItem.Text = "Edit Hex...";
        editHexToolStripMenuItem.Click += MenuEditOpenAsHexClicked;
        // 
        // toolStripSeparator4
        // 
        toolStripSeparator4.Name = "toolStripSeparator4";
        toolStripSeparator4.Size = new Size(222, 6);
        // 
        // copyFullPathToolStripMenuItem
        // 
        copyFullPathToolStripMenuItem.Name = "copyFullPathToolStripMenuItem";
        copyFullPathToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.C;
        copyFullPathToolStripMenuItem.Size = new Size(225, 22);
        copyFullPathToolStripMenuItem.Text = "Copy Full Path";
        copyFullPathToolStripMenuItem.Click += MenuEditCopyPathClicked;
        // 
        // toolStripSeparator10
        // 
        toolStripSeparator10.Name = "toolStripSeparator10";
        toolStripSeparator10.Size = new Size(222, 6);
        // 
        // renameToolStripMenuItem
        // 
        renameToolStripMenuItem.Name = "renameToolStripMenuItem";
        renameToolStripMenuItem.ShortcutKeys = Keys.F2;
        renameToolStripMenuItem.Size = new Size(225, 22);
        renameToolStripMenuItem.Text = "Rename...";
        renameToolStripMenuItem.Click += MenuEditRenameClicked;
        // 
        // deleteToolStripMenuItem
        // 
        deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
        deleteToolStripMenuItem.ShortcutKeys = Keys.Delete;
        deleteToolStripMenuItem.Size = new Size(225, 22);
        deleteToolStripMenuItem.Text = "Delete";
        deleteToolStripMenuItem.Click += MenuEditDeleteClicked;
        // 
        // swapFilesToolStripMenuItem
        // 
        swapFilesToolStripMenuItem.Name = "swapFilesToolStripMenuItem";
        swapFilesToolStripMenuItem.ShortcutKeys = Keys.Control | Keys.G;
        swapFilesToolStripMenuItem.Size = new Size(225, 22);
        swapFilesToolStripMenuItem.Text = "Swap";
        swapFilesToolStripMenuItem.Click += MenuEditSwapFileClicked;
        // 
        // toolStripSeparator3
        // 
        toolStripSeparator3.Name = "toolStripSeparator3";
        toolStripSeparator3.Size = new Size(222, 6);
        // 
        // copyToolStripMenuItem
        // 
        copyToolStripMenuItem.Name = "copyToolStripMenuItem";
        copyToolStripMenuItem.ShortcutKeyDisplayString = "Ctrl+C";
        copyToolStripMenuItem.Size = new Size(225, 22);
        copyToolStripMenuItem.Text = "Copy";
        copyToolStripMenuItem.Click += MenuEditCopyClicked;
        // 
        // pasteToolStripMenuItem
        // 
        pasteToolStripMenuItem.Name = "pasteToolStripMenuItem";
        pasteToolStripMenuItem.ShortcutKeyDisplayString = "Ctrl+V";
        pasteToolStripMenuItem.Size = new Size(225, 22);
        pasteToolStripMenuItem.Text = "Paste";
        pasteToolStripMenuItem.Click += MenuEditPasteClicked;
        // 
        // viewToolStripMenuItem
        // 
        viewToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { refreshToolStripMenuItem, toolStripSeparator6, goToParentToolStripMenuItem, goBackToolStripMenuItem, goForwardToolStripMenuItem, toolStripSeparator8, wordWrapMenuItem, toolStripSeparator7, showEmptyPnaFilesMenuItem, showHexMenuItem, showTerminalMenuItem });
        viewToolStripMenuItem.Name = "viewToolStripMenuItem";
        viewToolStripMenuItem.Size = new Size(44, 20);
        viewToolStripMenuItem.Text = "View";
        // 
        // refreshToolStripMenuItem
        // 
        refreshToolStripMenuItem.Name = "refreshToolStripMenuItem";
        refreshToolStripMenuItem.ShortcutKeys = Keys.F5;
        refreshToolStripMenuItem.Size = new Size(234, 22);
        refreshToolStripMenuItem.Text = "Refresh";
        refreshToolStripMenuItem.Click += MenuViewRefreshClicked;
        // 
        // toolStripSeparator6
        // 
        toolStripSeparator6.Name = "toolStripSeparator6";
        toolStripSeparator6.Size = new Size(231, 6);
        // 
        // goToParentToolStripMenuItem
        // 
        goToParentToolStripMenuItem.Name = "goToParentToolStripMenuItem";
        goToParentToolStripMenuItem.ShortcutKeyDisplayString = "Backspace";
        goToParentToolStripMenuItem.Size = new Size(234, 22);
        goToParentToolStripMenuItem.Text = "Go To Parent";
        goToParentToolStripMenuItem.Click += MenuViewGoToParentClicked;
        // 
        // goBackToolStripMenuItem
        // 
        goBackToolStripMenuItem.Name = "goBackToolStripMenuItem";
        goBackToolStripMenuItem.ShortcutKeys = Keys.Alt | Keys.Left;
        goBackToolStripMenuItem.Size = new Size(234, 22);
        goBackToolStripMenuItem.Text = "Go Back";
        goBackToolStripMenuItem.Click += MenuViewGoBackClicked;
        // 
        // goForwardToolStripMenuItem
        // 
        goForwardToolStripMenuItem.Name = "goForwardToolStripMenuItem";
        goForwardToolStripMenuItem.ShortcutKeys = Keys.Alt | Keys.Right;
        goForwardToolStripMenuItem.Size = new Size(234, 22);
        goForwardToolStripMenuItem.Text = "Go Forward";
        goForwardToolStripMenuItem.Click += MenuViewGoForwardClicked;
        // 
        // toolStripSeparator8
        // 
        toolStripSeparator8.Name = "toolStripSeparator8";
        toolStripSeparator8.Size = new Size(231, 6);
        // 
        // wordWrapMenuItem
        // 
        wordWrapMenuItem.CheckOnClick = true;
        wordWrapMenuItem.Name = "wordWrapMenuItem";
        wordWrapMenuItem.ShortcutKeys = Keys.Alt | Keys.Z;
        wordWrapMenuItem.Size = new Size(234, 22);
        wordWrapMenuItem.Text = "Word Wrap";
        wordWrapMenuItem.Click += MenuViewWordWrapClicked;
        // 
        // toolStripSeparator7
        // 
        toolStripSeparator7.Name = "toolStripSeparator7";
        toolStripSeparator7.Size = new Size(231, 6);
        // 
        // showEmptyPnaFilesMenuItem
        // 
        showEmptyPnaFilesMenuItem.CheckOnClick = true;
        showEmptyPnaFilesMenuItem.Name = "showEmptyPnaFilesMenuItem";
        showEmptyPnaFilesMenuItem.ShortcutKeys = Keys.Control | Keys.P;
        showEmptyPnaFilesMenuItem.Size = new Size(234, 22);
        showEmptyPnaFilesMenuItem.Text = "Show Empty PNA Files";
        showEmptyPnaFilesMenuItem.CheckStateChanged += MenuViewShowEmptyPnaChecked;
        showEmptyPnaFilesMenuItem.Click += MenuViewShowEmptyPNAFilesClicked;
        // 
        // showHexMenuItem
        // 
        showHexMenuItem.CheckOnClick = true;
        showHexMenuItem.Name = "showHexMenuItem";
        showHexMenuItem.ShortcutKeys = Keys.Control | Keys.H;
        showHexMenuItem.Size = new Size(234, 22);
        showHexMenuItem.Text = "Show Hex Viewer";
        showHexMenuItem.CheckedChanged += MenuViewShowHexChecked;
        // 
        // showTerminalMenuItem
        // 
        showTerminalMenuItem.CheckOnClick = true;
        showTerminalMenuItem.Name = "showTerminalMenuItem";
        showTerminalMenuItem.ShortcutKeyDisplayString = "Ctrl+~";
        showTerminalMenuItem.ShortcutKeys = Keys.Control | Keys.Oem3;
        showTerminalMenuItem.Size = new Size(234, 22);
        showTerminalMenuItem.Text = "Show Terminal";
        showTerminalMenuItem.CheckStateChanged += MenuViewShowTerminalCheckChanged;
        // 
        // fileListView
        // 
        fileListView.Columns.AddRange(new ColumnHeader[] { fileListViewNameColumn, fileListViewSizeColumn, fileListViewCrc32Column });
        fileListView.Dock = DockStyle.Fill;
        fileListView.Location = new Point(4, 31);
        fileListView.Name = "fileListView";
        fileListView.Size = new Size(346, 369);
        fileListView.TabIndex = 2;
        fileListView.UseCompatibleStateImageBehavior = false;
        fileListView.View = View.Details;
        fileListView.SelectedIndexChanged += FileListViewIndexChanged;
        fileListView.DoubleClick += FileListViewDoubleClicked;
        fileListView.KeyDown += FileListViewKeyDown;
        // 
        // fileListViewNameColumn
        // 
        fileListViewNameColumn.Text = "Name";
        fileListViewNameColumn.Width = 200;
        // 
        // fileListViewSizeColumn
        // 
        fileListViewSizeColumn.Text = "Size";
        fileListViewSizeColumn.TextAlign = HorizontalAlignment.Right;
        // 
        // fileListViewCrc32Column
        // 
        fileListViewCrc32Column.Text = "CRC32";
        fileListViewCrc32Column.TextAlign = HorizontalAlignment.Right;
        // 
        // statusStrip
        // 
        statusStrip.Items.AddRange(new ToolStripItem[] { statusLabel, fillerLabel, taskLabel, progressBar, cancelButton, fileInfoLabel });
        statusStrip.Location = new Point(0, 428);
        statusStrip.Name = "statusStrip";
        statusStrip.Size = new Size(800, 22);
        statusStrip.TabIndex = 3;
        statusStrip.Text = "statusStrip1";
        // 
        // statusLabel
        // 
        statusLabel.Name = "statusLabel";
        statusLabel.Size = new Size(0, 17);
        // 
        // fillerLabel
        // 
        fillerLabel.Name = "fillerLabel";
        fillerLabel.Size = new Size(785, 17);
        fillerLabel.Spring = true;
        // 
        // taskLabel
        // 
        taskLabel.Name = "taskLabel";
        taskLabel.Size = new Size(0, 17);
        // 
        // progressBar
        // 
        progressBar.Name = "progressBar";
        progressBar.Size = new Size(100, 16);
        progressBar.Visible = false;
        // 
        // cancelButton
        // 
        cancelButton.DisplayStyle = ToolStripItemDisplayStyle.Image;
        cancelButton.Image = (Image)resources.GetObject("cancelButton.Image");
        cancelButton.ImageTransparentColor = Color.Magenta;
        cancelButton.Name = "cancelButton";
        cancelButton.ShowDropDownArrow = false;
        cancelButton.Size = new Size(20, 20);
        cancelButton.Text = "toolStripDropDownButton1";
        cancelButton.Visible = false;
        cancelButton.Click += CancelButtonClicked;
        // 
        // fileInfoLabel
        // 
        fileInfoLabel.Name = "fileInfoLabel";
        fileInfoLabel.Size = new Size(0, 17);
        // 
        // filePreviewerSplitContainer
        // 
        filePreviewerSplitContainer.Dock = DockStyle.Fill;
        filePreviewerSplitContainer.FixedPanel = FixedPanel.Panel1;
        filePreviewerSplitContainer.Location = new Point(0, 24);
        filePreviewerSplitContainer.Name = "filePreviewerSplitContainer";
        // 
        // filePreviewerSplitContainer.Panel1
        // 
        filePreviewerSplitContainer.Panel1.Controls.Add(fileListView);
        filePreviewerSplitContainer.Panel1.Controls.Add(panel1);
        filePreviewerSplitContainer.Panel1.Controls.Add(pathTextBox);
        filePreviewerSplitContainer.Panel1.Padding = new Padding(4, 4, 0, 4);
        // 
        // filePreviewerSplitContainer.Panel2
        // 
        filePreviewerSplitContainer.Panel2.Controls.Add(terminalPreviewerSplitContainer);
        filePreviewerSplitContainer.Panel2.Margin = new Padding(4);
        filePreviewerSplitContainer.Size = new Size(800, 404);
        filePreviewerSplitContainer.SplitterDistance = 350;
        filePreviewerSplitContainer.TabIndex = 4;
        // 
        // panel1
        // 
        panel1.Dock = DockStyle.Top;
        panel1.Location = new Point(4, 27);
        panel1.Name = "panel1";
        panel1.Padding = new Padding(0, 0, 0, 4);
        panel1.Size = new Size(346, 4);
        panel1.TabIndex = 3;
        // 
        // pathTextBox
        // 
        pathTextBox.Dock = DockStyle.Top;
        pathTextBox.Location = new Point(4, 4);
        pathTextBox.Name = "pathTextBox";
        pathTextBox.Size = new Size(346, 23);
        pathTextBox.TabIndex = 4;
        pathTextBox.KeyDown += PathTextBoxKeyDown;
        // 
        // terminalPreviewerSplitContainer
        // 
        terminalPreviewerSplitContainer.Dock = DockStyle.Fill;
        terminalPreviewerSplitContainer.Location = new Point(0, 0);
        terminalPreviewerSplitContainer.Name = "terminalPreviewerSplitContainer";
        terminalPreviewerSplitContainer.Orientation = Orientation.Horizontal;
        // 
        // terminalPreviewerSplitContainer.Panel1
        // 
        terminalPreviewerSplitContainer.Panel1.Controls.Add(previewerTabControl);
        // 
        // terminalPreviewerSplitContainer.Panel2
        // 
        terminalPreviewerSplitContainer.Panel2.Controls.Add(panel4);
        terminalPreviewerSplitContainer.Size = new Size(446, 404);
        terminalPreviewerSplitContainer.SplitterDistance = 301;
        terminalPreviewerSplitContainer.TabIndex = 3;
        // 
        // previewerTabControl
        // 
        previewerTabControl.Controls.Add(textPreviewTab);
        previewerTabControl.Controls.Add(imagePreviewTab);
        previewerTabControl.Dock = DockStyle.Fill;
        previewerTabControl.Location = new Point(0, 0);
        previewerTabControl.Name = "previewerTabControl";
        previewerTabControl.SelectedIndex = 0;
        previewerTabControl.Size = new Size(446, 301);
        previewerTabControl.TabIndex = 0;
        // 
        // textPreviewTab
        // 
        textPreviewTab.Controls.Add(textPreviewBox);
        textPreviewTab.Controls.Add(panel2);
        textPreviewTab.Controls.Add(panel3);
        textPreviewTab.Location = new Point(4, 24);
        textPreviewTab.Name = "textPreviewTab";
        textPreviewTab.Padding = new Padding(3);
        textPreviewTab.Size = new Size(438, 273);
        textPreviewTab.TabIndex = 1;
        textPreviewTab.Text = "Text";
        textPreviewTab.UseVisualStyleBackColor = true;
        // 
        // textPreviewBox
        // 
        textPreviewBox.AutoCMaxHeight = 9;
        textPreviewBox.BiDirectionality = ScintillaNET.BiDirectionalDisplayType.Disabled;
        textPreviewBox.BorderStyle = ScintillaNET.BorderStyle.FixedSingle;
        textPreviewBox.CaretLineBackColor = Color.Black;
        textPreviewBox.CaretLineVisible = true;
        textPreviewBox.CaretStyle = ScintillaNET.CaretStyle.Invisible;
        textPreviewBox.Dock = DockStyle.Fill;
        textPreviewBox.Lexer = ScintillaNET.Lexer.Cpp;
        textPreviewBox.LexerName = "cpp";
        textPreviewBox.Location = new Point(3, 37);
        textPreviewBox.Name = "textPreviewBox";
        textPreviewBox.ReadOnly = true;
        textPreviewBox.ScrollWidth = 49;
        textPreviewBox.Size = new Size(432, 233);
        textPreviewBox.TabIndents = true;
        textPreviewBox.TabIndex = 3;
        textPreviewBox.UseRightToLeftReadingLayout = false;
        textPreviewBox.WrapMode = ScintillaNET.WrapMode.None;
        // 
        // panel2
        // 
        panel2.AutoSize = true;
        panel2.Dock = DockStyle.Top;
        panel2.Location = new Point(3, 33);
        panel2.Name = "panel2";
        panel2.Padding = new Padding(0, 0, 0, 4);
        panel2.Size = new Size(432, 4);
        panel2.TabIndex = 1;
        // 
        // panel3
        // 
        panel3.Controls.Add(encodingDropDown);
        panel3.Controls.Add(label1);
        panel3.Dock = DockStyle.Top;
        panel3.Location = new Point(3, 3);
        panel3.Name = "panel3";
        panel3.Padding = new Padding(4);
        panel3.Size = new Size(432, 30);
        panel3.TabIndex = 2;
        // 
        // encodingDropDown
        // 
        encodingDropDown.Dock = DockStyle.Fill;
        encodingDropDown.DropDownStyle = ComboBoxStyle.DropDownList;
        encodingDropDown.FormattingEnabled = true;
        encodingDropDown.Location = new Point(72, 4);
        encodingDropDown.Name = "encodingDropDown";
        encodingDropDown.Size = new Size(356, 23);
        encodingDropDown.TabIndex = 0;
        encodingDropDown.SelectedIndexChanged += EncodingDropDownIndexChanged;
        // 
        // label1
        // 
        label1.Dock = DockStyle.Left;
        label1.Location = new Point(4, 4);
        label1.Name = "label1";
        label1.Size = new Size(68, 22);
        label1.TabIndex = 1;
        label1.Text = "Encoding";
        label1.TextAlign = ContentAlignment.MiddleLeft;
        // 
        // imagePreviewTab
        // 
        imagePreviewTab.Controls.Add(imagePreviewBox);
        imagePreviewTab.Location = new Point(4, 24);
        imagePreviewTab.Name = "imagePreviewTab";
        imagePreviewTab.Padding = new Padding(3);
        imagePreviewTab.Size = new Size(438, 273);
        imagePreviewTab.TabIndex = 0;
        imagePreviewTab.Text = "Image";
        imagePreviewTab.UseVisualStyleBackColor = true;
        // 
        // imagePreviewBox
        // 
        imagePreviewBox.Dock = DockStyle.Fill;
        imagePreviewBox.Location = new Point(3, 3);
        imagePreviewBox.Name = "imagePreviewBox";
        imagePreviewBox.Size = new Size(432, 267);
        imagePreviewBox.SizeMode = PictureBoxSizeMode.Zoom;
        imagePreviewBox.TabIndex = 0;
        imagePreviewBox.TabStop = false;
        // 
        // panel4
        // 
        panel4.Controls.Add(terminalOutputTextBox);
        panel4.Controls.Add(panel5);
        panel4.Controls.Add(terminalInputTextBox);
        panel4.Dock = DockStyle.Fill;
        panel4.Location = new Point(0, 0);
        panel4.Name = "panel4";
        panel4.Padding = new Padding(4);
        panel4.Size = new Size(446, 99);
        panel4.TabIndex = 4;
        // 
        // terminalOutputTextBox
        // 
        terminalOutputTextBox.AutoCMaxHeight = 9;
        terminalOutputTextBox.BiDirectionality = ScintillaNET.BiDirectionalDisplayType.Disabled;
        terminalOutputTextBox.BorderStyle = ScintillaNET.BorderStyle.FixedSingle;
        terminalOutputTextBox.CaretLineBackColor = Color.Black;
        terminalOutputTextBox.CaretLineVisible = true;
        terminalOutputTextBox.CaretStyle = ScintillaNET.CaretStyle.Invisible;
        terminalOutputTextBox.Dock = DockStyle.Fill;
        terminalOutputTextBox.LexerName = null;
        terminalOutputTextBox.Location = new Point(4, 4);
        terminalOutputTextBox.Name = "terminalOutputTextBox";
        terminalOutputTextBox.ReadOnly = true;
        terminalOutputTextBox.ScrollWidth = 49;
        terminalOutputTextBox.Size = new Size(438, 66);
        terminalOutputTextBox.TabIndents = true;
        terminalOutputTextBox.TabIndex = 5;
        terminalOutputTextBox.UseRightToLeftReadingLayout = false;
        terminalOutputTextBox.WrapMode = ScintillaNET.WrapMode.Char;
        // 
        // panel5
        // 
        panel5.Dock = DockStyle.Bottom;
        panel5.Location = new Point(4, 70);
        panel5.Name = "panel5";
        panel5.Size = new Size(438, 2);
        panel5.TabIndex = 4;
        // 
        // terminalInputTextBox
        // 
        terminalInputTextBox.BorderStyle = BorderStyle.FixedSingle;
        terminalInputTextBox.Dock = DockStyle.Bottom;
        terminalInputTextBox.Location = new Point(4, 72);
        terminalInputTextBox.Name = "terminalInputTextBox";
        terminalInputTextBox.Size = new Size(438, 23);
        terminalInputTextBox.TabIndex = 2;
        // 
        // MainWindow
        // 
        AutoScaleDimensions = new SizeF(7F, 15F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(800, 450);
        Controls.Add(filePreviewerSplitContainer);
        Controls.Add(statusStrip);
        Controls.Add(menuStrip);
        MainMenuStrip = menuStrip;
        Name = "MainWindow";
        Text = "WS2 Explorer";
        FormClosing += OnFormClosing;
        ResizeEnd += OnFormResized;
        menuStrip.ResumeLayout(false);
        menuStrip.PerformLayout();
        statusStrip.ResumeLayout(false);
        statusStrip.PerformLayout();
        filePreviewerSplitContainer.Panel1.ResumeLayout(false);
        filePreviewerSplitContainer.Panel1.PerformLayout();
        filePreviewerSplitContainer.Panel2.ResumeLayout(false);
        ((System.ComponentModel.ISupportInitialize)filePreviewerSplitContainer).EndInit();
        filePreviewerSplitContainer.ResumeLayout(false);
        terminalPreviewerSplitContainer.Panel1.ResumeLayout(false);
        terminalPreviewerSplitContainer.Panel2.ResumeLayout(false);
        ((System.ComponentModel.ISupportInitialize)terminalPreviewerSplitContainer).EndInit();
        terminalPreviewerSplitContainer.ResumeLayout(false);
        previewerTabControl.ResumeLayout(false);
        textPreviewTab.ResumeLayout(false);
        textPreviewTab.PerformLayout();
        panel3.ResumeLayout(false);
        imagePreviewTab.ResumeLayout(false);
        ((System.ComponentModel.ISupportInitialize)imagePreviewBox).EndInit();
        panel4.ResumeLayout(false);
        panel4.PerformLayout();
        ResumeLayout(false);
        PerformLayout();
    }

    #endregion

    private MenuStrip menuStrip;
    private ToolStripMenuItem fileToolStripMenuItem;
    private ToolStripMenuItem openToolStripMenuItem;
    private ToolStripMenuItem openFolderToolStripMenuItem;
    private ListView fileListView;
    private ColumnHeader fileListViewNameColumn;
    private ColumnHeader fileListViewSizeColumn;
    private ColumnHeader fileListViewCrc32Column;
    private StatusStrip statusStrip;
    private ToolStripStatusLabel statusLabel;
    private ToolStripStatusLabel taskLabel;
    private ToolStripStatusLabel fillerLabel;
    private ToolStripMenuItem viewToolStripMenuItem;
    private ToolStripMenuItem showEmptyPnaFilesMenuItem;
    private SplitContainer filePreviewerSplitContainer;
    private Panel panel1;
    private TextBox pathTextBox;
    private ToolStripMenuItem editToolStripMenuItem;
    private ToolStripMenuItem swapFilesToolStripMenuItem;
    private ToolStripProgressBar progressBar;
    private ToolStripDropDownButton cancelButton;
    private TabControl previewerTabControl;
    private TabPage imagePreviewTab;
    private TabPage textPreviewTab;
    private PictureBox imagePreviewBox;
    private Panel panel2;
    private ComboBox encodingDropDown;
    private Panel panel3;
    private Label label1;
    private ToolStripMenuItem exportToolStripMenuItem;
    private ToolStripSeparator toolStripSeparator1;
    private ToolStripSeparator toolStripSeparator2;
    private ToolStripMenuItem exitToolStripMenuItem;
    private ToolStripMenuItem editHexToolStripMenuItem;
    private ToolStripMenuItem editInApplicationToolStripMenuItem;
    private ToolStripMenuItem copyToolStripMenuItem;
    private ToolStripMenuItem pasteToolStripMenuItem;
    private ToolStripMenuItem deleteToolStripMenuItem;
    private ToolStripSeparator toolStripSeparator4;
    private ToolStripSeparator toolStripSeparator3;
    private ToolStripMenuItem wordWrapMenuItem;
    private ToolStripMenuItem refreshToolStripMenuItem;
    private ToolStripMenuItem showHexMenuItem;
    private ToolStripMenuItem preferencesToolStripMenuItem;
    private ToolStripSeparator toolStripSeparator5;
    private ToolStripMenuItem renameToolStripMenuItem;
    private ToolStripMenuItem goToParentToolStripMenuItem;
    private ToolStripMenuItem goBackToolStripMenuItem;
    private ToolStripMenuItem goForwardToolStripMenuItem;
    private ToolStripSeparator toolStripSeparator6;
    private ToolStripSeparator toolStripSeparator8;
    private ToolStripSeparator toolStripSeparator7;
    private ToolStripMenuItem toolStripMenuItem1;
    private ToolStripMenuItem copyFullPathToolStripMenuItem;
    private ToolStripSeparator toolStripSeparator10;
    private SplitContainer terminalPreviewerSplitContainer;
    private TextBox terminalInputTextBox;
    private Panel panel4;
    private Panel panel5;
    private ScintillaNET.Scintilla textPreviewBox;
    private ScintillaNET.Scintilla terminalOutputTextBox;
    private ToolStripMenuItem showTerminalMenuItem;
    private ToolStripStatusLabel fileInfoLabel;
}
