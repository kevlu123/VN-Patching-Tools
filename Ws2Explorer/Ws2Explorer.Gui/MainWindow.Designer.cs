namespace Ws2Explorer.Gui
{
    partial class MainWindow
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainWindow));
            files_ListView = new ListView();
            name_ColumnHeader = new ColumnHeader();
            size_ColumnHeader = new ColumnHeader();
            path_TextBox = new TextBox();
            panels_SplitContainer = new SplitContainer();
            midSpacer_Panel = new Panel();
            bottomSpacer_Panel = new Panel();
            bottom_StatusStrip = new StatusStrip();
            status_StatusLabel = new ToolStripStatusLabel();
            filler_StatusLabel = new ToolStripStatusLabel();
            task_StatusLabel = new ToolStripStatusLabel();
            progress_ProgressBar = new ToolStripProgressBar();
            cancel_Button = new ToolStripDropDownButton();
            caption_StatusLabel = new ToolStripStatusLabel();
            menu_MenuStrip = new MenuStrip();
            file_MenuItem = new ToolStripMenuItem();
            newFile_MenuItem = new ToolStripMenuItem();
            newDirectory_MenuItem = new ToolStripMenuItem();
            open_MenuItem = new ToolStripMenuItem();
            openFolder_MenuItem = new ToolStripMenuItem();
            toolStripSeparator1 = new ToolStripSeparator();
            export_MenuItem = new ToolStripMenuItem();
            recursiveExtract_MenuItem = new ToolStripMenuItem();
            diff_MenuItem = new ToolStripMenuItem();
            toolStripSeparator12 = new ToolStripSeparator();
            createArchive_MenuItem = new ToolStripMenuItem();
            createArc_MenuItem = new ToolStripMenuItem();
            createLegacyArc8_MenuItem = new ToolStripMenuItem();
            createLegacyArc12_MenuItem = new ToolStripMenuItem();
            createPna_MenuItem = new ToolStripMenuItem();
            createPan_MenuItem = new ToolStripMenuItem();
            createPtf_MenuItem = new ToolStripMenuItem();
            createWs2_MenuItem = new ToolStripMenuItem();
            createWsc_MenuItem = new ToolStripMenuItem();
            openArchiveAs_MenuItem = new ToolStripMenuItem();
            openAsArc_MenuItem = new ToolStripMenuItem();
            openAsLegacyArc8_MenuItem = new ToolStripMenuItem();
            openAsLegacyArc12_MenuItem = new ToolStripMenuItem();
            openAsPna_MenuItem = new ToolStripMenuItem();
            openAsPan_MenuItem = new ToolStripMenuItem();
            openAsPtf_MenuItem = new ToolStripMenuItem();
            openAsWs2_MenuItem = new ToolStripMenuItem();
            openAsWsc_MenuItem = new ToolStripMenuItem();
            toolStripSeparator2 = new ToolStripSeparator();
            reveal_MenuItem = new ToolStripMenuItem();
            setEditors_MenuItem = new ToolStripMenuItem();
            toolStripSeparator3 = new ToolStripSeparator();
            about_MenuItem = new ToolStripMenuItem();
            exit_MenuItem = new ToolStripMenuItem();
            edit_MenuItem = new ToolStripMenuItem();
            editInApp_MenuItem = new ToolStripMenuItem();
            editAs_MenuItem = new ToolStripMenuItem();
            editAsText_MenuItem = new ToolStripMenuItem();
            editAsImage_MenuItem = new ToolStripMenuItem();
            editAsHex_MenuItem = new ToolStripMenuItem();
            toolStripSeparator4 = new ToolStripSeparator();
            rename_MenuItem = new ToolStripMenuItem();
            delete_MenuItem = new ToolStripMenuItem();
            duplicate_MenuItem = new ToolStripMenuItem();
            toolStripSeparator5 = new ToolStripSeparator();
            copy_MenuItem = new ToolStripMenuItem();
            paste_MenuItem = new ToolStripMenuItem();
            toolStripSeparator6 = new ToolStripSeparator();
            changePath_MenuItem = new ToolStripMenuItem();
            toolStripSeparator13 = new ToolStripSeparator();
            editPna_MenuItem = new ToolStripMenuItem();
            pnaAddEntry_MenuItem = new ToolStripMenuItem();
            swap_MenuItem = new ToolStripMenuItem();
            view_MenuItem = new ToolStripMenuItem();
            refresh_MenuItem = new ToolStripMenuItem();
            toolStripSeparator7 = new ToolStripSeparator();
            goToParent_MenuItem = new ToolStripMenuItem();
            goBack_MenuItem = new ToolStripMenuItem();
            goForward_MenuItem = new ToolStripMenuItem();
            toolStripSeparator8 = new ToolStripSeparator();
            wordWrap_MenuItem = new ToolStripMenuItem();
            toolStripSeparator9 = new ToolStripSeparator();
            listFiles_MenuItem = new ToolStripMenuItem();
            viewMetadata_MenuItem = new ToolStripMenuItem();
            viewPna_MenuItem = new ToolStripMenuItem();
            pnaShowEmpty_MenuItem = new ToolStripMenuItem();
            game_MenuItem = new ToolStripMenuItem();
            launchGame_MenuItem = new ToolStripMenuItem();
            toolStripSeparator11 = new ToolStripSeparator();
            setEntry_MenuItem = new ToolStripMenuItem();
            modifyNames_MenuItem = new ToolStripMenuItem();
            convertLuacToText_MenuItem = new ToolStripMenuItem();
            toolStripSeparator10 = new ToolStripSeparator();
            findReferences_MenuItem = new ToolStripMenuItem();
            showChoices_MenuItem = new ToolStripMenuItem();
            mermaidFlowchart_MenuItem = new ToolStripMenuItem();
            jsonFlowchart_MenuItem = new ToolStripMenuItem();
            back_Panel = new Panel();
            createLng_MenuItem = new ToolStripMenuItem();
            openAsLng_MenuItem = new ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)panels_SplitContainer).BeginInit();
            panels_SplitContainer.Panel1.SuspendLayout();
            panels_SplitContainer.SuspendLayout();
            bottom_StatusStrip.SuspendLayout();
            menu_MenuStrip.SuspendLayout();
            back_Panel.SuspendLayout();
            SuspendLayout();
            // 
            // files_ListView
            // 
            files_ListView.AllowDrop = true;
            files_ListView.Columns.AddRange(new ColumnHeader[] { name_ColumnHeader, size_ColumnHeader });
            files_ListView.Dock = DockStyle.Fill;
            files_ListView.Location = new Point(0, 27);
            files_ListView.Name = "files_ListView";
            files_ListView.Size = new Size(263, 365);
            files_ListView.TabIndex = 0;
            files_ListView.UseCompatibleStateImageBehavior = false;
            files_ListView.View = View.Details;
            files_ListView.ColumnClick += Files_ListViewColumnClicked;
            files_ListView.ColumnWidthChanged += Files_ListViewColumnWidthChanged;
            files_ListView.SelectedIndexChanged += Files_ListViewSelectedIndexChanged;
            files_ListView.ClientSizeChanged += Files_ListViewClientSizeChanged;
            files_ListView.DragDrop += Files_ListViewDragDropped;
            files_ListView.DragOver += Files_ListViewDragOver;
            files_ListView.DoubleClick += Files_ListViewDoubleClicked;
            // 
            // name_ColumnHeader
            // 
            name_ColumnHeader.Text = "Name";
            name_ColumnHeader.Width = 200;
            // 
            // size_ColumnHeader
            // 
            size_ColumnHeader.Text = "Size";
            size_ColumnHeader.TextAlign = HorizontalAlignment.Right;
            size_ColumnHeader.Width = 80;
            // 
            // path_TextBox
            // 
            path_TextBox.AllowDrop = true;
            path_TextBox.Dock = DockStyle.Top;
            path_TextBox.Location = new Point(0, 0);
            path_TextBox.Name = "path_TextBox";
            path_TextBox.Size = new Size(263, 23);
            path_TextBox.TabIndex = 1;
            path_TextBox.DragDrop += Path_TextBoxDragDropped;
            path_TextBox.DragOver += Path_TextBoxDragOver;
            // 
            // panels_SplitContainer
            // 
            panels_SplitContainer.Dock = DockStyle.Fill;
            panels_SplitContainer.Location = new Point(0, 0);
            panels_SplitContainer.Name = "panels_SplitContainer";
            // 
            // panels_SplitContainer.Panel1
            // 
            panels_SplitContainer.Panel1.Controls.Add(files_ListView);
            panels_SplitContainer.Panel1.Controls.Add(midSpacer_Panel);
            panels_SplitContainer.Panel1.Controls.Add(path_TextBox);
            panels_SplitContainer.Size = new Size(792, 392);
            panels_SplitContainer.SplitterDistance = 263;
            panels_SplitContainer.TabIndex = 3;
            panels_SplitContainer.SplitterMoving += Panels_SplitContainerSplitterMoving;
            panels_SplitContainer.ClientSizeChanged += Panels_SplitContainerClientSizeChanged;
            // 
            // midSpacer_Panel
            // 
            midSpacer_Panel.Dock = DockStyle.Top;
            midSpacer_Panel.Location = new Point(0, 23);
            midSpacer_Panel.Name = "midSpacer_Panel";
            midSpacer_Panel.Size = new Size(263, 4);
            midSpacer_Panel.TabIndex = 6;
            // 
            // bottomSpacer_Panel
            // 
            bottomSpacer_Panel.Dock = DockStyle.Bottom;
            bottomSpacer_Panel.Location = new Point(0, 392);
            bottomSpacer_Panel.Name = "bottomSpacer_Panel";
            bottomSpacer_Panel.Size = new Size(792, 4);
            bottomSpacer_Panel.TabIndex = 7;
            // 
            // bottom_StatusStrip
            // 
            bottom_StatusStrip.Items.AddRange(new ToolStripItem[] { status_StatusLabel, filler_StatusLabel, task_StatusLabel, progress_ProgressBar, cancel_Button, caption_StatusLabel });
            bottom_StatusStrip.Location = new Point(4, 424);
            bottom_StatusStrip.Name = "bottom_StatusStrip";
            bottom_StatusStrip.Size = new Size(792, 22);
            bottom_StatusStrip.TabIndex = 4;
            // 
            // status_StatusLabel
            // 
            status_StatusLabel.Name = "status_StatusLabel";
            status_StatusLabel.Size = new Size(0, 17);
            // 
            // filler_StatusLabel
            // 
            filler_StatusLabel.Name = "filler_StatusLabel";
            filler_StatusLabel.Size = new Size(646, 17);
            filler_StatusLabel.Spring = true;
            // 
            // task_StatusLabel
            // 
            task_StatusLabel.Name = "task_StatusLabel";
            task_StatusLabel.Size = new Size(0, 17);
            // 
            // progress_ProgressBar
            // 
            progress_ProgressBar.Name = "progress_ProgressBar";
            progress_ProgressBar.Size = new Size(100, 16);
            // 
            // cancel_Button
            // 
            cancel_Button.DisplayStyle = ToolStripItemDisplayStyle.Image;
            cancel_Button.Image = (Image)resources.GetObject("cancel_Button.Image");
            cancel_Button.ImageTransparentColor = Color.Magenta;
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(29, 20);
            cancel_Button.Text = "toolStripDropDownButton1";
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // caption_StatusLabel
            // 
            caption_StatusLabel.Name = "caption_StatusLabel";
            caption_StatusLabel.Size = new Size(0, 17);
            // 
            // menu_MenuStrip
            // 
            menu_MenuStrip.BackColor = SystemColors.Control;
            menu_MenuStrip.Items.AddRange(new ToolStripItem[] { file_MenuItem, edit_MenuItem, view_MenuItem, game_MenuItem });
            menu_MenuStrip.Location = new Point(4, 4);
            menu_MenuStrip.Name = "menu_MenuStrip";
            menu_MenuStrip.Size = new Size(792, 24);
            menu_MenuStrip.TabIndex = 5;
            // 
            // file_MenuItem
            // 
            file_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { newFile_MenuItem, newDirectory_MenuItem, open_MenuItem, openFolder_MenuItem, toolStripSeparator1, export_MenuItem, recursiveExtract_MenuItem, diff_MenuItem, toolStripSeparator12, createArchive_MenuItem, openArchiveAs_MenuItem, toolStripSeparator2, reveal_MenuItem, setEditors_MenuItem, toolStripSeparator3, about_MenuItem, exit_MenuItem });
            file_MenuItem.Name = "file_MenuItem";
            file_MenuItem.Size = new Size(37, 20);
            file_MenuItem.Text = "File";
            // 
            // newFile_MenuItem
            // 
            newFile_MenuItem.Name = "newFile_MenuItem";
            newFile_MenuItem.ShortcutKeys = Keys.Control | Keys.N;
            newFile_MenuItem.Size = new Size(244, 22);
            newFile_MenuItem.Text = "New...";
            newFile_MenuItem.Click += NewFile_MenuItemClicked;
            // 
            // newDirectory_MenuItem
            // 
            newDirectory_MenuItem.Name = "newDirectory_MenuItem";
            newDirectory_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.N;
            newDirectory_MenuItem.Size = new Size(244, 22);
            newDirectory_MenuItem.Text = "New Directory...";
            newDirectory_MenuItem.Click += NewDirectory_MenuItemClicked;
            // 
            // open_MenuItem
            // 
            open_MenuItem.Name = "open_MenuItem";
            open_MenuItem.ShortcutKeys = Keys.Control | Keys.O;
            open_MenuItem.Size = new Size(244, 22);
            open_MenuItem.Text = "Open...";
            open_MenuItem.Click += Open_MenuItemClicked;
            // 
            // openFolder_MenuItem
            // 
            openFolder_MenuItem.Name = "openFolder_MenuItem";
            openFolder_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.O;
            openFolder_MenuItem.Size = new Size(244, 22);
            openFolder_MenuItem.Text = "Open Folder...";
            openFolder_MenuItem.Click += OpenFolder_MenuItemClicked;
            // 
            // toolStripSeparator1
            // 
            toolStripSeparator1.Name = "toolStripSeparator1";
            toolStripSeparator1.Size = new Size(241, 6);
            // 
            // export_MenuItem
            // 
            export_MenuItem.Name = "export_MenuItem";
            export_MenuItem.ShortcutKeys = Keys.Control | Keys.S;
            export_MenuItem.Size = new Size(244, 22);
            export_MenuItem.Text = "Export...";
            export_MenuItem.Click += Export_MenuItemClicked;
            // 
            // recursiveExtract_MenuItem
            // 
            recursiveExtract_MenuItem.Name = "recursiveExtract_MenuItem";
            recursiveExtract_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.S;
            recursiveExtract_MenuItem.Size = new Size(244, 22);
            recursiveExtract_MenuItem.Text = "Recursive Extract...";
            recursiveExtract_MenuItem.Click += RecursiveExtract_MenuItemClicked;
            // 
            // diff_MenuItem
            // 
            diff_MenuItem.Name = "diff_MenuItem";
            diff_MenuItem.ShortcutKeys = Keys.F3;
            diff_MenuItem.Size = new Size(244, 22);
            diff_MenuItem.Text = "Diff...";
            diff_MenuItem.Click += Diff_MenuItemClicked;
            // 
            // toolStripSeparator12
            // 
            toolStripSeparator12.Name = "toolStripSeparator12";
            toolStripSeparator12.Size = new Size(241, 6);
            // 
            // createArchive_MenuItem
            // 
            createArchive_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { createArc_MenuItem, createLegacyArc8_MenuItem, createLegacyArc12_MenuItem, createPna_MenuItem, createPan_MenuItem, createPtf_MenuItem, createWs2_MenuItem, createWsc_MenuItem, createLng_MenuItem });
            createArchive_MenuItem.Name = "createArchive_MenuItem";
            createArchive_MenuItem.Size = new Size(244, 22);
            createArchive_MenuItem.Text = "Create Archive";
            // 
            // createArc_MenuItem
            // 
            createArc_MenuItem.Name = "createArc_MenuItem";
            createArc_MenuItem.ShortcutKeys = Keys.Control | Keys.F1;
            createArc_MenuItem.Size = new Size(235, 22);
            createArc_MenuItem.Text = "ARC";
            createArc_MenuItem.Click += CreateArc_MenuItemClicked;
            // 
            // createLegacyArc8_MenuItem
            // 
            createLegacyArc8_MenuItem.Name = "createLegacyArc8_MenuItem";
            createLegacyArc8_MenuItem.ShortcutKeys = Keys.Control | Keys.F2;
            createLegacyArc8_MenuItem.Size = new Size(235, 22);
            createLegacyArc8_MenuItem.Text = "ARC (Legacy, 8 char)";
            createLegacyArc8_MenuItem.Click += CreateLegacyArc8_MenuItemClicked;
            // 
            // createLegacyArc12_MenuItem
            // 
            createLegacyArc12_MenuItem.Name = "createLegacyArc12_MenuItem";
            createLegacyArc12_MenuItem.ShortcutKeys = Keys.Control | Keys.F3;
            createLegacyArc12_MenuItem.Size = new Size(235, 22);
            createLegacyArc12_MenuItem.Text = "ARC (Legacy, 12 char)";
            createLegacyArc12_MenuItem.Click += CreateLegacyArc12_MenuItemClicked;
            // 
            // createPna_MenuItem
            // 
            createPna_MenuItem.Name = "createPna_MenuItem";
            createPna_MenuItem.ShortcutKeys = Keys.Control | Keys.F4;
            createPna_MenuItem.Size = new Size(235, 22);
            createPna_MenuItem.Text = "PNA";
            createPna_MenuItem.Click += CreatePna_MenuItemClicked;
            // 
            // createPan_MenuItem
            // 
            createPan_MenuItem.Name = "createPan_MenuItem";
            createPan_MenuItem.ShortcutKeys = Keys.Control | Keys.F5;
            createPan_MenuItem.Size = new Size(235, 22);
            createPan_MenuItem.Text = "PAN";
            createPan_MenuItem.Click += CreatePan_MenuItemClicked;
            // 
            // createPtf_MenuItem
            // 
            createPtf_MenuItem.Name = "createPtf_MenuItem";
            createPtf_MenuItem.ShortcutKeys = Keys.Control | Keys.F6;
            createPtf_MenuItem.Size = new Size(235, 22);
            createPtf_MenuItem.Text = "PTF";
            createPtf_MenuItem.Click += CreatePtf_MenuItemClicked;
            // 
            // createWs2_MenuItem
            // 
            createWs2_MenuItem.Name = "createWs2_MenuItem";
            createWs2_MenuItem.ShortcutKeys = Keys.Control | Keys.F7;
            createWs2_MenuItem.Size = new Size(235, 22);
            createWs2_MenuItem.Text = "WS2";
            createWs2_MenuItem.Click += CreateWs2_MenuItemClicked;
            // 
            // createWsc_MenuItem
            // 
            createWsc_MenuItem.Name = "createWsc_MenuItem";
            createWsc_MenuItem.ShortcutKeys = Keys.Control | Keys.F8;
            createWsc_MenuItem.Size = new Size(235, 22);
            createWsc_MenuItem.Text = "WSC";
            createWsc_MenuItem.Click += CreateWsc_MenuItemClicked;
            // 
            // openArchiveAs_MenuItem
            // 
            openArchiveAs_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { openAsArc_MenuItem, openAsLegacyArc8_MenuItem, openAsLegacyArc12_MenuItem, openAsPna_MenuItem, openAsPan_MenuItem, openAsPtf_MenuItem, openAsWs2_MenuItem, openAsWsc_MenuItem, openAsLng_MenuItem });
            openArchiveAs_MenuItem.Name = "openArchiveAs_MenuItem";
            openArchiveAs_MenuItem.Size = new Size(244, 22);
            openArchiveAs_MenuItem.Text = "Open Archive As";
            // 
            // openAsArc_MenuItem
            // 
            openAsArc_MenuItem.Name = "openAsArc_MenuItem";
            openAsArc_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F1;
            openAsArc_MenuItem.Size = new Size(267, 22);
            openAsArc_MenuItem.Text = "ARC";
            openAsArc_MenuItem.Click += OpenAsArc_MenuItemClicked;
            // 
            // openAsLegacyArc8_MenuItem
            // 
            openAsLegacyArc8_MenuItem.Name = "openAsLegacyArc8_MenuItem";
            openAsLegacyArc8_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F2;
            openAsLegacyArc8_MenuItem.Size = new Size(267, 22);
            openAsLegacyArc8_MenuItem.Text = "ARC (Legacy, 8 char)";
            openAsLegacyArc8_MenuItem.Click += OpenAsLegacyArc8_MenuItemClicked;
            // 
            // openAsLegacyArc12_MenuItem
            // 
            openAsLegacyArc12_MenuItem.Name = "openAsLegacyArc12_MenuItem";
            openAsLegacyArc12_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F3;
            openAsLegacyArc12_MenuItem.Size = new Size(267, 22);
            openAsLegacyArc12_MenuItem.Text = "ARC (Legacy, 12 char)";
            openAsLegacyArc12_MenuItem.Click += OpenAsLegacyArc12_MenuItemClicked;
            // 
            // openAsPna_MenuItem
            // 
            openAsPna_MenuItem.Name = "openAsPna_MenuItem";
            openAsPna_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F4;
            openAsPna_MenuItem.Size = new Size(267, 22);
            openAsPna_MenuItem.Text = "PNA";
            openAsPna_MenuItem.Click += OpenAsPna_MenuItemClicked;
            // 
            // openAsPan_MenuItem
            // 
            openAsPan_MenuItem.Name = "openAsPan_MenuItem";
            openAsPan_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F5;
            openAsPan_MenuItem.Size = new Size(267, 22);
            openAsPan_MenuItem.Text = "PAN";
            openAsPan_MenuItem.Click += OpenAsPan_MenuItemClicked;
            // 
            // openAsPtf_MenuItem
            // 
            openAsPtf_MenuItem.Name = "openAsPtf_MenuItem";
            openAsPtf_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F6;
            openAsPtf_MenuItem.Size = new Size(267, 22);
            openAsPtf_MenuItem.Text = "PTF";
            openAsPtf_MenuItem.Click += OpenAsPtf_MenuItemClicked;
            // 
            // openAsWs2_MenuItem
            // 
            openAsWs2_MenuItem.Name = "openAsWs2_MenuItem";
            openAsWs2_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F7;
            openAsWs2_MenuItem.Size = new Size(267, 22);
            openAsWs2_MenuItem.Text = "WS2";
            openAsWs2_MenuItem.Click += OpenAsWs2_MenuItemClicked;
            // 
            // openAsWsc_MenuItem
            // 
            openAsWsc_MenuItem.Name = "openAsWsc_MenuItem";
            openAsWsc_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F8;
            openAsWsc_MenuItem.Size = new Size(267, 22);
            openAsWsc_MenuItem.Text = "WSC";
            openAsWsc_MenuItem.Click += OpenAsWsc_MenuItemClicked;
            // 
            // toolStripSeparator2
            // 
            toolStripSeparator2.Name = "toolStripSeparator2";
            toolStripSeparator2.Size = new Size(241, 6);
            // 
            // reveal_MenuItem
            // 
            reveal_MenuItem.Name = "reveal_MenuItem";
            reveal_MenuItem.ShortcutKeys = Keys.Control | Keys.R;
            reveal_MenuItem.Size = new Size(244, 22);
            reveal_MenuItem.Text = "Reveal in File Explorer";
            reveal_MenuItem.Click += Reveal_MenuItemClicked;
            // 
            // setEditors_MenuItem
            // 
            setEditors_MenuItem.Name = "setEditors_MenuItem";
            setEditors_MenuItem.ShortcutKeys = Keys.F4;
            setEditors_MenuItem.Size = new Size(244, 22);
            setEditors_MenuItem.Text = "Set Editors...";
            setEditors_MenuItem.Click += SetEditors_MenuItemClicked;
            // 
            // toolStripSeparator3
            // 
            toolStripSeparator3.Name = "toolStripSeparator3";
            toolStripSeparator3.Size = new Size(241, 6);
            // 
            // about_MenuItem
            // 
            about_MenuItem.Name = "about_MenuItem";
            about_MenuItem.ShortcutKeyDisplayString = "Ctrl+Shift+?";
            about_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.Oem2;
            about_MenuItem.Size = new Size(244, 22);
            about_MenuItem.Text = "About...";
            about_MenuItem.Click += About_MenuItemClicked;
            // 
            // exit_MenuItem
            // 
            exit_MenuItem.Name = "exit_MenuItem";
            exit_MenuItem.ShortcutKeys = Keys.Alt | Keys.F4;
            exit_MenuItem.Size = new Size(244, 22);
            exit_MenuItem.Text = "Exit";
            exit_MenuItem.Click += Exit_MenuItemClicked;
            // 
            // edit_MenuItem
            // 
            edit_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { editInApp_MenuItem, editAs_MenuItem, toolStripSeparator4, rename_MenuItem, delete_MenuItem, duplicate_MenuItem, toolStripSeparator5, copy_MenuItem, paste_MenuItem, toolStripSeparator6, changePath_MenuItem, toolStripSeparator13, editPna_MenuItem });
            edit_MenuItem.Name = "edit_MenuItem";
            edit_MenuItem.Size = new Size(39, 20);
            edit_MenuItem.Text = "Edit";
            // 
            // editInApp_MenuItem
            // 
            editInApp_MenuItem.Name = "editInApp_MenuItem";
            editInApp_MenuItem.ShortcutKeys = Keys.Control | Keys.E;
            editInApp_MenuItem.Size = new Size(220, 22);
            editInApp_MenuItem.Text = "Edit in Application...";
            editInApp_MenuItem.Click += EditInApp_MenuItemClicked;
            // 
            // editAs_MenuItem
            // 
            editAs_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { editAsText_MenuItem, editAsImage_MenuItem, editAsHex_MenuItem });
            editAs_MenuItem.Name = "editAs_MenuItem";
            editAs_MenuItem.Size = new Size(220, 22);
            editAs_MenuItem.Text = "Edit As";
            // 
            // editAsText_MenuItem
            // 
            editAsText_MenuItem.Name = "editAsText_MenuItem";
            editAsText_MenuItem.ShortcutKeys = Keys.Control | Keys.D1;
            editAsText_MenuItem.Size = new Size(156, 22);
            editAsText_MenuItem.Text = "Text...";
            editAsText_MenuItem.Click += EditAsText_MenuItemClicked;
            // 
            // editAsImage_MenuItem
            // 
            editAsImage_MenuItem.Name = "editAsImage_MenuItem";
            editAsImage_MenuItem.ShortcutKeys = Keys.Control | Keys.D2;
            editAsImage_MenuItem.Size = new Size(156, 22);
            editAsImage_MenuItem.Text = "Image...";
            editAsImage_MenuItem.Click += EditAsImage_MenuItemClicked;
            // 
            // editAsHex_MenuItem
            // 
            editAsHex_MenuItem.Name = "editAsHex_MenuItem";
            editAsHex_MenuItem.ShortcutKeys = Keys.Control | Keys.D3;
            editAsHex_MenuItem.Size = new Size(156, 22);
            editAsHex_MenuItem.Text = "Hex...";
            editAsHex_MenuItem.Click += EditAsHex_MenuItemClicked;
            // 
            // toolStripSeparator4
            // 
            toolStripSeparator4.Name = "toolStripSeparator4";
            toolStripSeparator4.Size = new Size(217, 6);
            // 
            // rename_MenuItem
            // 
            rename_MenuItem.Name = "rename_MenuItem";
            rename_MenuItem.ShortcutKeys = Keys.F2;
            rename_MenuItem.Size = new Size(220, 22);
            rename_MenuItem.Text = "Rename...";
            rename_MenuItem.Click += Rename_MenuItemClicked;
            // 
            // delete_MenuItem
            // 
            delete_MenuItem.Name = "delete_MenuItem";
            delete_MenuItem.ShortcutKeyDisplayString = "Delete";
            delete_MenuItem.Size = new Size(220, 22);
            delete_MenuItem.Text = "Delete";
            delete_MenuItem.Click += Delete_MenuItemClicked;
            // 
            // duplicate_MenuItem
            // 
            duplicate_MenuItem.Name = "duplicate_MenuItem";
            duplicate_MenuItem.ShortcutKeys = Keys.Control | Keys.D;
            duplicate_MenuItem.Size = new Size(220, 22);
            duplicate_MenuItem.Text = "Duplicate";
            duplicate_MenuItem.Click += Duplicate_MenuItemClicked;
            // 
            // toolStripSeparator5
            // 
            toolStripSeparator5.Name = "toolStripSeparator5";
            toolStripSeparator5.Size = new Size(217, 6);
            // 
            // copy_MenuItem
            // 
            copy_MenuItem.Name = "copy_MenuItem";
            copy_MenuItem.ShortcutKeyDisplayString = "Ctrl+C";
            copy_MenuItem.Size = new Size(220, 22);
            copy_MenuItem.Text = "Copy";
            copy_MenuItem.Click += Copy_MenuItemClicked;
            // 
            // paste_MenuItem
            // 
            paste_MenuItem.Name = "paste_MenuItem";
            paste_MenuItem.ShortcutKeyDisplayString = "Ctrl+V";
            paste_MenuItem.Size = new Size(220, 22);
            paste_MenuItem.Text = "Paste";
            paste_MenuItem.Click += Paste_MenuItemClicked;
            // 
            // toolStripSeparator6
            // 
            toolStripSeparator6.Name = "toolStripSeparator6";
            toolStripSeparator6.Size = new Size(217, 6);
            // 
            // changePath_MenuItem
            // 
            changePath_MenuItem.Name = "changePath_MenuItem";
            changePath_MenuItem.ShortcutKeys = Keys.Control | Keys.Q;
            changePath_MenuItem.Size = new Size(220, 22);
            changePath_MenuItem.Text = "Change Path";
            changePath_MenuItem.Click += ChangePath_MenuItemClicked;
            // 
            // toolStripSeparator13
            // 
            toolStripSeparator13.Name = "toolStripSeparator13";
            toolStripSeparator13.Size = new Size(217, 6);
            // 
            // editPna_MenuItem
            // 
            editPna_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { pnaAddEntry_MenuItem, swap_MenuItem });
            editPna_MenuItem.Name = "editPna_MenuItem";
            editPna_MenuItem.Size = new Size(220, 22);
            editPna_MenuItem.Text = "PNA";
            // 
            // pnaAddEntry_MenuItem
            // 
            pnaAddEntry_MenuItem.Name = "pnaAddEntry_MenuItem";
            pnaAddEntry_MenuItem.ShortcutKeys = Keys.Control | Keys.H;
            pnaAddEntry_MenuItem.Size = new Size(182, 22);
            pnaAddEntry_MenuItem.Text = "Add Entry";
            pnaAddEntry_MenuItem.Click += PnaAddEntry_MenuItemClicked;
            // 
            // swap_MenuItem
            // 
            swap_MenuItem.Name = "swap_MenuItem";
            swap_MenuItem.ShortcutKeys = Keys.Control | Keys.G;
            swap_MenuItem.Size = new Size(182, 22);
            swap_MenuItem.Text = "Swap Entries";
            swap_MenuItem.Click += PnaSwap_MenuItemClicked;
            // 
            // view_MenuItem
            // 
            view_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { refresh_MenuItem, toolStripSeparator7, goToParent_MenuItem, goBack_MenuItem, goForward_MenuItem, toolStripSeparator8, wordWrap_MenuItem, toolStripSeparator9, listFiles_MenuItem, viewMetadata_MenuItem, viewPna_MenuItem });
            view_MenuItem.Name = "view_MenuItem";
            view_MenuItem.Size = new Size(44, 20);
            view_MenuItem.Text = "View";
            // 
            // refresh_MenuItem
            // 
            refresh_MenuItem.Name = "refresh_MenuItem";
            refresh_MenuItem.ShortcutKeys = Keys.F5;
            refresh_MenuItem.Size = new Size(202, 22);
            refresh_MenuItem.Text = "Refresh";
            refresh_MenuItem.Click += Refresh_MenuItemClicked;
            // 
            // toolStripSeparator7
            // 
            toolStripSeparator7.Name = "toolStripSeparator7";
            toolStripSeparator7.Size = new Size(199, 6);
            // 
            // goToParent_MenuItem
            // 
            goToParent_MenuItem.Name = "goToParent_MenuItem";
            goToParent_MenuItem.ShortcutKeyDisplayString = "Backspace";
            goToParent_MenuItem.Size = new Size(202, 22);
            goToParent_MenuItem.Text = "Go to Parent";
            goToParent_MenuItem.Click += GoToParent_MenuItemClicked;
            // 
            // goBack_MenuItem
            // 
            goBack_MenuItem.Name = "goBack_MenuItem";
            goBack_MenuItem.ShortcutKeys = Keys.Alt | Keys.Left;
            goBack_MenuItem.Size = new Size(202, 22);
            goBack_MenuItem.Text = "Go Back";
            goBack_MenuItem.Click += GoBack_MenuItemClicked;
            // 
            // goForward_MenuItem
            // 
            goForward_MenuItem.Name = "goForward_MenuItem";
            goForward_MenuItem.ShortcutKeys = Keys.Alt | Keys.Right;
            goForward_MenuItem.Size = new Size(202, 22);
            goForward_MenuItem.Text = "Go Forward";
            goForward_MenuItem.Click += GoForward_MenuItemClicked;
            // 
            // toolStripSeparator8
            // 
            toolStripSeparator8.Name = "toolStripSeparator8";
            toolStripSeparator8.Size = new Size(199, 6);
            // 
            // wordWrap_MenuItem
            // 
            wordWrap_MenuItem.CheckOnClick = true;
            wordWrap_MenuItem.Name = "wordWrap_MenuItem";
            wordWrap_MenuItem.ShortcutKeys = Keys.Alt | Keys.Z;
            wordWrap_MenuItem.Size = new Size(202, 22);
            wordWrap_MenuItem.Text = "Word Wrap";
            wordWrap_MenuItem.CheckedChanged += WordWrap_MenuItemCheckChanged;
            // 
            // toolStripSeparator9
            // 
            toolStripSeparator9.Name = "toolStripSeparator9";
            toolStripSeparator9.Size = new Size(199, 6);
            // 
            // listFiles_MenuItem
            // 
            listFiles_MenuItem.Name = "listFiles_MenuItem";
            listFiles_MenuItem.ShortcutKeys = Keys.F1;
            listFiles_MenuItem.Size = new Size(202, 22);
            listFiles_MenuItem.Text = "List Files...";
            listFiles_MenuItem.Click += ListFiles_MenuItemClicked;
            // 
            // viewMetadata_MenuItem
            // 
            viewMetadata_MenuItem.Name = "viewMetadata_MenuItem";
            viewMetadata_MenuItem.ShortcutKeyDisplayString = "Ctrl+?";
            viewMetadata_MenuItem.ShortcutKeys = Keys.Control | Keys.Oem2;
            viewMetadata_MenuItem.Size = new Size(202, 22);
            viewMetadata_MenuItem.Text = "View Metadata...";
            viewMetadata_MenuItem.Click += ViewMetadata_MenuItemClicked;
            // 
            // viewPna_MenuItem
            // 
            viewPna_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { pnaShowEmpty_MenuItem });
            viewPna_MenuItem.Name = "viewPna_MenuItem";
            viewPna_MenuItem.Size = new Size(202, 22);
            viewPna_MenuItem.Text = "PNA";
            // 
            // pnaShowEmpty_MenuItem
            // 
            pnaShowEmpty_MenuItem.Checked = true;
            pnaShowEmpty_MenuItem.CheckOnClick = true;
            pnaShowEmpty_MenuItem.CheckState = CheckState.Checked;
            pnaShowEmpty_MenuItem.Name = "pnaShowEmpty_MenuItem";
            pnaShowEmpty_MenuItem.ShortcutKeys = Keys.Control | Keys.P;
            pnaShowEmpty_MenuItem.Size = new Size(181, 22);
            pnaShowEmpty_MenuItem.Text = "Show Empty";
            pnaShowEmpty_MenuItem.CheckedChanged += PnaShowEmpty_MenuItemCheckChanged;
            // 
            // game_MenuItem
            // 
            game_MenuItem.DropDownItems.AddRange(new ToolStripItem[] { launchGame_MenuItem, toolStripSeparator11, setEntry_MenuItem, modifyNames_MenuItem, convertLuacToText_MenuItem, toolStripSeparator10, findReferences_MenuItem, showChoices_MenuItem, mermaidFlowchart_MenuItem, jsonFlowchart_MenuItem });
            game_MenuItem.Name = "game_MenuItem";
            game_MenuItem.Size = new Size(50, 20);
            game_MenuItem.Text = "Game";
            // 
            // launchGame_MenuItem
            // 
            launchGame_MenuItem.Name = "launchGame_MenuItem";
            launchGame_MenuItem.ShortcutKeys = Keys.F10;
            launchGame_MenuItem.Size = new Size(249, 22);
            launchGame_MenuItem.Text = "Launch Game";
            launchGame_MenuItem.Click += LaunchGame_MenuItemClicked;
            // 
            // toolStripSeparator11
            // 
            toolStripSeparator11.Name = "toolStripSeparator11";
            toolStripSeparator11.Size = new Size(246, 6);
            // 
            // setEntry_MenuItem
            // 
            setEntry_MenuItem.Name = "setEntry_MenuItem";
            setEntry_MenuItem.ShortcutKeys = Keys.F11;
            setEntry_MenuItem.Size = new Size(249, 22);
            setEntry_MenuItem.Text = "Set WS2 Entry Point...";
            setEntry_MenuItem.Click += SetEntry_MenuItemClicked;
            // 
            // modifyNames_MenuItem
            // 
            modifyNames_MenuItem.Name = "modifyNames_MenuItem";
            modifyNames_MenuItem.ShortcutKeys = Keys.F12;
            modifyNames_MenuItem.Size = new Size(249, 22);
            modifyNames_MenuItem.Text = "Modify Names...";
            modifyNames_MenuItem.Click += ModifyNames_MenuItemClicked;
            // 
            // convertLuacToText_MenuItem
            // 
            convertLuacToText_MenuItem.Name = "convertLuacToText_MenuItem";
            convertLuacToText_MenuItem.ShortcutKeys = Keys.F8;
            convertLuacToText_MenuItem.Size = new Size(249, 22);
            convertLuacToText_MenuItem.Text = "Convert Luac to Text...";
            convertLuacToText_MenuItem.Click += ConvertLuacToText_MenuItemClicked;
            // 
            // toolStripSeparator10
            // 
            toolStripSeparator10.Name = "toolStripSeparator10";
            toolStripSeparator10.Size = new Size(246, 6);
            // 
            // findReferences_MenuItem
            // 
            findReferences_MenuItem.Name = "findReferences_MenuItem";
            findReferences_MenuItem.ShortcutKeys = Keys.Control | Keys.F;
            findReferences_MenuItem.Size = new Size(249, 22);
            findReferences_MenuItem.Text = "Find String References...";
            findReferences_MenuItem.Click += FindReferences_MenuItemClicked;
            // 
            // showChoices_MenuItem
            // 
            showChoices_MenuItem.Name = "showChoices_MenuItem";
            showChoices_MenuItem.ShortcutKeys = Keys.F7;
            showChoices_MenuItem.Size = new Size(249, 22);
            showChoices_MenuItem.Text = "Show Choices...";
            showChoices_MenuItem.Click += ShowChoices_MenuItem;
            // 
            // mermaidFlowchart_MenuItem
            // 
            mermaidFlowchart_MenuItem.Name = "mermaidFlowchart_MenuItem";
            mermaidFlowchart_MenuItem.ShortcutKeys = Keys.F6;
            mermaidFlowchart_MenuItem.Size = new Size(249, 22);
            mermaidFlowchart_MenuItem.Text = "Show Mermaid Flowchart...";
            mermaidFlowchart_MenuItem.Click += MermaidFlowchart_MenuItemClicked;
            // 
            // jsonFlowchart_MenuItem
            // 
            jsonFlowchart_MenuItem.Name = "jsonFlowchart_MenuItem";
            jsonFlowchart_MenuItem.ShortcutKeys = Keys.Shift | Keys.F6;
            jsonFlowchart_MenuItem.Size = new Size(249, 22);
            jsonFlowchart_MenuItem.Text = "Show JSON Flowchart...";
            jsonFlowchart_MenuItem.Click += JsonFlowchart_MenuItemClicked;
            // 
            // back_Panel
            // 
            back_Panel.Controls.Add(panels_SplitContainer);
            back_Panel.Controls.Add(bottomSpacer_Panel);
            back_Panel.Dock = DockStyle.Fill;
            back_Panel.Location = new Point(4, 28);
            back_Panel.Name = "back_Panel";
            back_Panel.Size = new Size(792, 396);
            back_Panel.TabIndex = 6;
            // 
            // createLng_MenuItem
            // 
            createLng_MenuItem.Name = "createLng_MenuItem";
            createLng_MenuItem.ShortcutKeys = Keys.Control | Keys.F9;
            createLng_MenuItem.Size = new Size(235, 22);
            createLng_MenuItem.Text = "LNG";
            createLng_MenuItem.Click += CreateLng_MenuItemClicked;
            // 
            // openAsLng_MenuItem
            // 
            openAsLng_MenuItem.Name = "openAsLng_MenuItem";
            openAsLng_MenuItem.ShortcutKeys = Keys.Control | Keys.Shift | Keys.F9;
            openAsLng_MenuItem.Size = new Size(267, 22);
            openAsLng_MenuItem.Text = "LNG";
            openAsLng_MenuItem.Click += OpenAsLng_MenuItemClicked;
            // 
            // MainWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(back_Panel);
            Controls.Add(menu_MenuStrip);
            Controls.Add(bottom_StatusStrip);
            MainMenuStrip = menu_MenuStrip;
            Name = "MainWindow";
            Padding = new Padding(4);
            Text = "Ws2Explorer";
            FormClosing += MainForm_FormClosing;
            LocationChanged += MainForm_LocationChanged;
            SizeChanged += MainForm_SizeChanged;
            panels_SplitContainer.Panel1.ResumeLayout(false);
            panels_SplitContainer.Panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)panels_SplitContainer).EndInit();
            panels_SplitContainer.ResumeLayout(false);
            bottom_StatusStrip.ResumeLayout(false);
            bottom_StatusStrip.PerformLayout();
            menu_MenuStrip.ResumeLayout(false);
            menu_MenuStrip.PerformLayout();
            back_Panel.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ListView files_ListView;
        private TextBox path_TextBox;
        private SplitContainer panels_SplitContainer;
        private StatusStrip bottom_StatusStrip;
        private MenuStrip menu_MenuStrip;
        private ToolStripMenuItem file_MenuItem;
        private ToolStripMenuItem edit_MenuItem;
        private ToolStripMenuItem view_MenuItem;
        private Panel midSpacer_Panel;
        private Panel back_Panel;
        private Panel bottomSpacer_Panel;
        private ToolStripStatusLabel status_StatusLabel;
        private ToolStripStatusLabel filler_StatusLabel;
        private ToolStripProgressBar progress_ProgressBar;
        private ToolStripDropDownButton cancel_Button;
        private ToolStripMenuItem open_MenuItem;
        private ToolStripMenuItem openFolder_MenuItem;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripMenuItem export_MenuItem;
        private ToolStripSeparator toolStripSeparator2;
        private ToolStripMenuItem reveal_MenuItem;
        private ToolStripMenuItem setEditors_MenuItem;
        private ToolStripSeparator toolStripSeparator3;
        private ToolStripMenuItem exit_MenuItem;
        private ToolStripMenuItem editInApp_MenuItem;
        private ToolStripSeparator toolStripSeparator4;
        private ToolStripMenuItem rename_MenuItem;
        private ToolStripMenuItem delete_MenuItem;
        private ToolStripMenuItem duplicate_MenuItem;
        private ToolStripMenuItem editAs_MenuItem;
        private ToolStripMenuItem editAsText_MenuItem;
        private ToolStripMenuItem editAsImage_MenuItem;
        private ToolStripMenuItem editAsHex_MenuItem;
        private ToolStripSeparator toolStripSeparator5;
        private ToolStripMenuItem copy_MenuItem;
        private ToolStripMenuItem paste_MenuItem;
        private ToolStripSeparator toolStripSeparator6;
        private ToolStripMenuItem editPna_MenuItem;
        private ToolStripMenuItem pnaAddEntry_MenuItem;
        private ToolStripMenuItem refresh_MenuItem;
        private ToolStripSeparator toolStripSeparator7;
        private ToolStripMenuItem goToParent_MenuItem;
        private ToolStripMenuItem goBack_MenuItem;
        private ToolStripMenuItem goForward_MenuItem;
        private ToolStripSeparator toolStripSeparator8;
        private ToolStripMenuItem wordWrap_MenuItem;
        private ToolStripSeparator toolStripSeparator9;
        private ToolStripMenuItem viewPna_MenuItem;
        private ToolStripMenuItem pnaShowEmpty_MenuItem;
        private ColumnHeader name_ColumnHeader;
        private ColumnHeader size_ColumnHeader;
        private ToolStripStatusLabel task_StatusLabel;
        private ToolStripStatusLabel caption_StatusLabel;
        private ToolStripMenuItem swap_MenuItem;
        private ToolStripMenuItem newFile_MenuItem;
        private ToolStripSeparator toolStripSeparator12;
        private ToolStripMenuItem createArchive_MenuItem;
        private ToolStripMenuItem createArc_MenuItem;
        private ToolStripMenuItem createPna_MenuItem;
        private ToolStripMenuItem createPan_MenuItem;
        private ToolStripMenuItem createPtf_MenuItem;
        private ToolStripMenuItem createWs2_MenuItem;
        private ToolStripMenuItem openArchiveAs_MenuItem;
        private ToolStripMenuItem openAsArc_MenuItem;
        private ToolStripMenuItem openAsPna_MenuItem;
        private ToolStripMenuItem openAsPan_MenuItem;
        private ToolStripMenuItem openAsPtf_MenuItem;
        private ToolStripMenuItem openAsWs2_MenuItem;
        private ToolStripMenuItem about_MenuItem;
        private ToolStripMenuItem viewMetadata_MenuItem;
        private ToolStripMenuItem game_MenuItem;
        private ToolStripMenuItem setEntry_MenuItem;
        private ToolStripMenuItem launchGame_MenuItem;
        private ToolStripMenuItem convertLuacToText_MenuItem;
        private ToolStripMenuItem showChoices_MenuItem;
        private ToolStripMenuItem jsonFlowchart_MenuItem;
        private ToolStripMenuItem mermaidFlowchart_MenuItem;
        private ToolStripSeparator toolStripSeparator11;
        private ToolStripSeparator toolStripSeparator10;
        private ToolStripMenuItem modifyNames_MenuItem;
        private ToolStripMenuItem changePath_MenuItem;
        private ToolStripSeparator toolStripSeparator13;
        private ToolStripMenuItem recursiveExtract_MenuItem;
        private ToolStripMenuItem diff_MenuItem;
        private ToolStripMenuItem newDirectory_MenuItem;
        private ToolStripMenuItem listFiles_MenuItem;
        private ToolStripMenuItem findReferences_MenuItem;
        private ToolStripMenuItem createLegacyArc8_MenuItem;
        private ToolStripMenuItem openAsLegacyArc8_MenuItem;
        private ToolStripMenuItem createLegacyArc12_MenuItem;
        private ToolStripMenuItem openAsLegacyArc12_MenuItem;
        private ToolStripMenuItem createWsc_MenuItem;
        private ToolStripMenuItem openAsWsc_MenuItem;
        private ToolStripMenuItem createLng_MenuItem;
        private ToolStripMenuItem openAsLng_MenuItem;
    }
}
