namespace Ws2Explorer.Gui
{
    partial class DiffWindow
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            oldFiles_Label = new Label();
            oldFilenames_TextBox = new TextBox();
            newFilenames_TextBox = new TextBox();
            newFiles_Label = new Label();
            saveOldOnly_CheckBox = new CheckBox();
            saveNewOnly_CheckBox = new CheckBox();
            saveChanged_CheckBox = new CheckBox();
            saveCommon_CheckBox = new CheckBox();
            browseOldFiles_Button = new Button();
            browseNewFiles_Button = new Button();
            cancel_Button = new Button();
            ok_Button = new Button();
            destination_TextBox = new TextBox();
            destination_Label = new Label();
            browseDestination_Button = new Button();
            SuspendLayout();
            // 
            // oldFiles_Label
            // 
            oldFiles_Label.AutoSize = true;
            oldFiles_Label.Location = new Point(21, 20);
            oldFiles_Label.Name = "oldFiles_Label";
            oldFiles_Label.Size = new Size(52, 15);
            oldFiles_Label.TabIndex = 1;
            oldFiles_Label.Text = "Old Files";
            // 
            // oldFilenames_TextBox
            // 
            oldFilenames_TextBox.AcceptsReturn = true;
            oldFilenames_TextBox.AcceptsTab = true;
            oldFilenames_TextBox.Location = new Point(21, 38);
            oldFilenames_TextBox.Multiline = true;
            oldFilenames_TextBox.Name = "oldFilenames_TextBox";
            oldFilenames_TextBox.PlaceholderText = "Add files...";
            oldFilenames_TextBox.ScrollBars = ScrollBars.Both;
            oldFilenames_TextBox.Size = new Size(644, 150);
            oldFilenames_TextBox.TabIndex = 2;
            // 
            // newFilenames_TextBox
            // 
            newFilenames_TextBox.AcceptsReturn = true;
            newFilenames_TextBox.AcceptsTab = true;
            newFilenames_TextBox.Location = new Point(21, 219);
            newFilenames_TextBox.Multiline = true;
            newFilenames_TextBox.Name = "newFilenames_TextBox";
            newFilenames_TextBox.PlaceholderText = "Add files...";
            newFilenames_TextBox.ScrollBars = ScrollBars.Both;
            newFilenames_TextBox.Size = new Size(644, 150);
            newFilenames_TextBox.TabIndex = 4;
            // 
            // newFiles_Label
            // 
            newFiles_Label.AutoSize = true;
            newFiles_Label.Location = new Point(21, 201);
            newFiles_Label.Name = "newFiles_Label";
            newFiles_Label.Size = new Size(57, 15);
            newFiles_Label.TabIndex = 3;
            newFiles_Label.Text = "New Files";
            // 
            // saveOldOnly_CheckBox
            // 
            saveOldOnly_CheckBox.AutoSize = true;
            saveOldOnly_CheckBox.Location = new Point(21, 447);
            saveOldOnly_CheckBox.Name = "saveOldOnly_CheckBox";
            saveOldOnly_CheckBox.Size = new Size(100, 19);
            saveOldOnly_CheckBox.TabIndex = 5;
            saveOldOnly_CheckBox.Text = "Save Old Only";
            saveOldOnly_CheckBox.UseVisualStyleBackColor = true;
            // 
            // saveNewOnly_CheckBox
            // 
            saveNewOnly_CheckBox.AutoSize = true;
            saveNewOnly_CheckBox.Checked = true;
            saveNewOnly_CheckBox.CheckState = CheckState.Checked;
            saveNewOnly_CheckBox.Location = new Point(127, 447);
            saveNewOnly_CheckBox.Name = "saveNewOnly_CheckBox";
            saveNewOnly_CheckBox.Size = new Size(105, 19);
            saveNewOnly_CheckBox.TabIndex = 6;
            saveNewOnly_CheckBox.Text = "Save New Only";
            saveNewOnly_CheckBox.UseVisualStyleBackColor = true;
            // 
            // saveChanged_CheckBox
            // 
            saveChanged_CheckBox.AutoSize = true;
            saveChanged_CheckBox.Checked = true;
            saveChanged_CheckBox.CheckState = CheckState.Checked;
            saveChanged_CheckBox.Location = new Point(238, 447);
            saveChanged_CheckBox.Name = "saveChanged_CheckBox";
            saveChanged_CheckBox.Size = new Size(101, 19);
            saveChanged_CheckBox.TabIndex = 7;
            saveChanged_CheckBox.Text = "Save Changed";
            saveChanged_CheckBox.UseVisualStyleBackColor = true;
            // 
            // saveCommon_CheckBox
            // 
            saveCommon_CheckBox.AutoSize = true;
            saveCommon_CheckBox.Location = new Point(345, 447);
            saveCommon_CheckBox.Name = "saveCommon_CheckBox";
            saveCommon_CheckBox.Size = new Size(104, 19);
            saveCommon_CheckBox.TabIndex = 8;
            saveCommon_CheckBox.Text = "Save Common";
            saveCommon_CheckBox.UseVisualStyleBackColor = true;
            // 
            // browseOldFiles_Button
            // 
            browseOldFiles_Button.Location = new Point(671, 101);
            browseOldFiles_Button.Name = "browseOldFiles_Button";
            browseOldFiles_Button.Size = new Size(75, 23);
            browseOldFiles_Button.TabIndex = 9;
            browseOldFiles_Button.Text = "Browse";
            browseOldFiles_Button.UseVisualStyleBackColor = true;
            browseOldFiles_Button.Click += BrowseOldFiles_ButtonClicked;
            // 
            // browseNewFiles_Button
            // 
            browseNewFiles_Button.Location = new Point(671, 281);
            browseNewFiles_Button.Name = "browseNewFiles_Button";
            browseNewFiles_Button.Size = new Size(75, 23);
            browseNewFiles_Button.TabIndex = 10;
            browseNewFiles_Button.Text = "Browse";
            browseNewFiles_Button.UseVisualStyleBackColor = true;
            browseNewFiles_Button.Click += BrowseNewFiles_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(671, 447);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 11;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(590, 447);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 12;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // destination_TextBox
            // 
            destination_TextBox.Location = new Point(21, 399);
            destination_TextBox.Name = "destination_TextBox";
            destination_TextBox.Size = new Size(644, 23);
            destination_TextBox.TabIndex = 13;
            // 
            // destination_Label
            // 
            destination_Label.AutoSize = true;
            destination_Label.Location = new Point(21, 381);
            destination_Label.Name = "destination_Label";
            destination_Label.Size = new Size(67, 15);
            destination_Label.TabIndex = 14;
            destination_Label.Text = "Destination";
            // 
            // browseDestination_Button
            // 
            browseDestination_Button.Location = new Point(671, 399);
            browseDestination_Button.Name = "browseDestination_Button";
            browseDestination_Button.Size = new Size(75, 23);
            browseDestination_Button.TabIndex = 15;
            browseDestination_Button.Text = "Browse";
            browseDestination_Button.UseVisualStyleBackColor = true;
            browseDestination_Button.Click += BrowseDestination_Button;
            // 
            // DiffWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(763, 484);
            Controls.Add(browseDestination_Button);
            Controls.Add(destination_Label);
            Controls.Add(destination_TextBox);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            Controls.Add(browseNewFiles_Button);
            Controls.Add(browseOldFiles_Button);
            Controls.Add(saveCommon_CheckBox);
            Controls.Add(saveChanged_CheckBox);
            Controls.Add(saveNewOnly_CheckBox);
            Controls.Add(saveOldOnly_CheckBox);
            Controls.Add(newFilenames_TextBox);
            Controls.Add(newFiles_Label);
            Controls.Add(oldFilenames_TextBox);
            Controls.Add(oldFiles_Label);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "DiffWindow";
            Text = "Diff Archives";
            FormClosed += DiffForm_Closed;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Label oldFiles_Label;
        private TextBox oldFilenames_TextBox;
        private TextBox newFilenames_TextBox;
        private Label newFiles_Label;
        private CheckBox saveOldOnly_CheckBox;
        private CheckBox saveNewOnly_CheckBox;
        private CheckBox saveChanged_CheckBox;
        private CheckBox saveCommon_CheckBox;
        private Button browseOldFiles_Button;
        private Button browseNewFiles_Button;
        private Button cancel_Button;
        private Button ok_Button;
        private TextBox destination_TextBox;
        private Label destination_Label;
        private Button browseDestination_Button;
    }
}