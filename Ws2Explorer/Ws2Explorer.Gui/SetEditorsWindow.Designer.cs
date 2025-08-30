namespace Ws2Explorer.Gui {
    partial class SetEditorsWindow {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            textEditorPath_TextBox = new TextBox();
            textEditorProgram_Label = new Label();
            textEditorBrowse_Button = new Button();
            textEditorArgs_TextBox = new TextBox();
            textEditorArgs_Label = new Label();
            textEditor_GroupBox = new GroupBox();
            ok_Button = new Button();
            cancel_Button = new Button();
            imageEditor_GroupBox = new GroupBox();
            imageEditorProgram_Label = new Label();
            imageEditorArgs_TextBox = new TextBox();
            imageEditorArgs_Label = new Label();
            imageEditorPath_TextBox = new TextBox();
            imageEditorBrowse_Button = new Button();
            hexEditor_GroupBox = new GroupBox();
            hexEditorProgram_Label = new Label();
            hexEditorArgs_TextBox = new TextBox();
            hexEditorArgs_Label = new Label();
            hexEditorPath_TextBox = new TextBox();
            hexEditorBrowse_Button = new Button();
            textEditor_GroupBox.SuspendLayout();
            imageEditor_GroupBox.SuspendLayout();
            hexEditor_GroupBox.SuspendLayout();
            SuspendLayout();
            // 
            // textEditorPath_TextBox
            // 
            textEditorPath_TextBox.Location = new Point(78, 17);
            textEditorPath_TextBox.Name = "textEditorPath_TextBox";
            textEditorPath_TextBox.Size = new Size(475, 23);
            textEditorPath_TextBox.TabIndex = 0;
            // 
            // textEditorProgram_Label
            // 
            textEditorProgram_Label.AutoSize = true;
            textEditorProgram_Label.Location = new Point(6, 21);
            textEditorProgram_Label.Name = "textEditorProgram_Label";
            textEditorProgram_Label.Size = new Size(53, 15);
            textEditorProgram_Label.TabIndex = 1;
            textEditorProgram_Label.Text = "Program";
            // 
            // textEditorBrowse_Button
            // 
            textEditorBrowse_Button.Location = new Point(559, 17);
            textEditorBrowse_Button.Name = "textEditorBrowse_Button";
            textEditorBrowse_Button.Size = new Size(36, 23);
            textEditorBrowse_Button.TabIndex = 8;
            textEditorBrowse_Button.Text = "...";
            textEditorBrowse_Button.UseVisualStyleBackColor = true;
            textEditorBrowse_Button.Click += TextEditorBrowse_ButtonClicked;
            // 
            // textEditorArgs_TextBox
            // 
            textEditorArgs_TextBox.Location = new Point(78, 51);
            textEditorArgs_TextBox.Name = "textEditorArgs_TextBox";
            textEditorArgs_TextBox.Size = new Size(517, 23);
            textEditorArgs_TextBox.TabIndex = 11;
            // 
            // textEditorArgs_Label
            // 
            textEditorArgs_Label.AutoSize = true;
            textEditorArgs_Label.Location = new Point(6, 51);
            textEditorArgs_Label.Name = "textEditorArgs_Label";
            textEditorArgs_Label.Size = new Size(66, 15);
            textEditorArgs_Label.TabIndex = 12;
            textEditorArgs_Label.Text = "Arguments";
            // 
            // textEditor_GroupBox
            // 
            textEditor_GroupBox.Controls.Add(textEditorProgram_Label);
            textEditor_GroupBox.Controls.Add(textEditorArgs_TextBox);
            textEditor_GroupBox.Controls.Add(textEditorArgs_Label);
            textEditor_GroupBox.Controls.Add(textEditorPath_TextBox);
            textEditor_GroupBox.Controls.Add(textEditorBrowse_Button);
            textEditor_GroupBox.Location = new Point(12, 12);
            textEditor_GroupBox.Name = "textEditor_GroupBox";
            textEditor_GroupBox.Size = new Size(601, 86);
            textEditor_GroupBox.TabIndex = 13;
            textEditor_GroupBox.TabStop = false;
            textEditor_GroupBox.Text = "Text Editor";
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(457, 288);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 7;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(538, 288);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 6;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // imageEditor_GroupBox
            // 
            imageEditor_GroupBox.Controls.Add(imageEditorProgram_Label);
            imageEditor_GroupBox.Controls.Add(imageEditorArgs_TextBox);
            imageEditor_GroupBox.Controls.Add(imageEditorArgs_Label);
            imageEditor_GroupBox.Controls.Add(imageEditorPath_TextBox);
            imageEditor_GroupBox.Controls.Add(imageEditorBrowse_Button);
            imageEditor_GroupBox.Location = new Point(12, 104);
            imageEditor_GroupBox.Name = "imageEditor_GroupBox";
            imageEditor_GroupBox.Size = new Size(601, 86);
            imageEditor_GroupBox.TabIndex = 14;
            imageEditor_GroupBox.TabStop = false;
            imageEditor_GroupBox.Text = "Image Editor";
            // 
            // imageEditorProgram_Label
            // 
            imageEditorProgram_Label.AutoSize = true;
            imageEditorProgram_Label.Location = new Point(6, 21);
            imageEditorProgram_Label.Name = "imageEditorProgram_Label";
            imageEditorProgram_Label.Size = new Size(53, 15);
            imageEditorProgram_Label.TabIndex = 1;
            imageEditorProgram_Label.Text = "Program";
            // 
            // imageEditorArgs_TextBox
            // 
            imageEditorArgs_TextBox.Location = new Point(78, 51);
            imageEditorArgs_TextBox.Name = "imageEditorArgs_TextBox";
            imageEditorArgs_TextBox.Size = new Size(517, 23);
            imageEditorArgs_TextBox.TabIndex = 11;
            // 
            // imageEditorArgs_Label
            // 
            imageEditorArgs_Label.AutoSize = true;
            imageEditorArgs_Label.Location = new Point(6, 51);
            imageEditorArgs_Label.Name = "imageEditorArgs_Label";
            imageEditorArgs_Label.Size = new Size(66, 15);
            imageEditorArgs_Label.TabIndex = 12;
            imageEditorArgs_Label.Text = "Arguments";
            // 
            // imageEditorPath_TextBox
            // 
            imageEditorPath_TextBox.Location = new Point(78, 17);
            imageEditorPath_TextBox.Name = "imageEditorPath_TextBox";
            imageEditorPath_TextBox.Size = new Size(475, 23);
            imageEditorPath_TextBox.TabIndex = 0;
            // 
            // imageEditorBrowse_Button
            // 
            imageEditorBrowse_Button.Location = new Point(559, 17);
            imageEditorBrowse_Button.Name = "imageEditorBrowse_Button";
            imageEditorBrowse_Button.Size = new Size(36, 23);
            imageEditorBrowse_Button.TabIndex = 8;
            imageEditorBrowse_Button.Text = "...";
            imageEditorBrowse_Button.UseVisualStyleBackColor = true;
            imageEditorBrowse_Button.Click += ImageEditorBrowse_ButtonClicked;
            // 
            // hexEditor_GroupBox
            // 
            hexEditor_GroupBox.Controls.Add(hexEditorProgram_Label);
            hexEditor_GroupBox.Controls.Add(hexEditorArgs_TextBox);
            hexEditor_GroupBox.Controls.Add(hexEditorArgs_Label);
            hexEditor_GroupBox.Controls.Add(hexEditorPath_TextBox);
            hexEditor_GroupBox.Controls.Add(hexEditorBrowse_Button);
            hexEditor_GroupBox.Location = new Point(12, 196);
            hexEditor_GroupBox.Name = "hexEditor_GroupBox";
            hexEditor_GroupBox.Size = new Size(601, 86);
            hexEditor_GroupBox.TabIndex = 14;
            hexEditor_GroupBox.TabStop = false;
            hexEditor_GroupBox.Text = "Hex Editor";
            // 
            // hexEditorProgram_Label
            // 
            hexEditorProgram_Label.AutoSize = true;
            hexEditorProgram_Label.Location = new Point(6, 21);
            hexEditorProgram_Label.Name = "hexEditorProgram_Label";
            hexEditorProgram_Label.Size = new Size(53, 15);
            hexEditorProgram_Label.TabIndex = 1;
            hexEditorProgram_Label.Text = "Program";
            // 
            // hexEditorArgs_TextBox
            // 
            hexEditorArgs_TextBox.Location = new Point(78, 51);
            hexEditorArgs_TextBox.Name = "hexEditorArgs_TextBox";
            hexEditorArgs_TextBox.Size = new Size(517, 23);
            hexEditorArgs_TextBox.TabIndex = 11;
            // 
            // hexEditorArgs_Label
            // 
            hexEditorArgs_Label.AutoSize = true;
            hexEditorArgs_Label.Location = new Point(6, 51);
            hexEditorArgs_Label.Name = "hexEditorArgs_Label";
            hexEditorArgs_Label.Size = new Size(66, 15);
            hexEditorArgs_Label.TabIndex = 12;
            hexEditorArgs_Label.Text = "Arguments";
            // 
            // hexEditorPath_TextBox
            // 
            hexEditorPath_TextBox.Location = new Point(78, 17);
            hexEditorPath_TextBox.Name = "hexEditorPath_TextBox";
            hexEditorPath_TextBox.Size = new Size(475, 23);
            hexEditorPath_TextBox.TabIndex = 0;
            // 
            // hexEditorBrowse_Button
            // 
            hexEditorBrowse_Button.Location = new Point(559, 17);
            hexEditorBrowse_Button.Name = "hexEditorBrowse_Button";
            hexEditorBrowse_Button.Size = new Size(36, 23);
            hexEditorBrowse_Button.TabIndex = 8;
            hexEditorBrowse_Button.Text = "...";
            hexEditorBrowse_Button.UseVisualStyleBackColor = true;
            hexEditorBrowse_Button.Click += HexEditorBrowse_ButtonClicked;
            // 
            // SetEditorsWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(626, 323);
            Controls.Add(hexEditor_GroupBox);
            Controls.Add(imageEditor_GroupBox);
            Controls.Add(textEditor_GroupBox);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "SetEditorsWindow";
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Set Editors";
            textEditor_GroupBox.ResumeLayout(false);
            textEditor_GroupBox.PerformLayout();
            imageEditor_GroupBox.ResumeLayout(false);
            imageEditor_GroupBox.PerformLayout();
            hexEditor_GroupBox.ResumeLayout(false);
            hexEditor_GroupBox.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private TextBox textEditorPath_TextBox;
        private Label textEditorProgram_Label;
        private Button textEditorBrowse_Button;
        private TextBox textEditorArgs_TextBox;
        private Label textEditorArgs_Label;
        private GroupBox textEditor_GroupBox;
        private Button ok_Button;
        private Button cancel_Button;
        private GroupBox imageEditor_GroupBox;
        private Label imageEditorProgram_Label;
        private TextBox imageEditorArgs_TextBox;
        private Label imageEditorArgs_Label;
        private TextBox imageEditorPath_TextBox;
        private Button imageEditorBrowse_Button;
        private GroupBox hexEditor_GroupBox;
        private Label hexEditorProgram_Label;
        private TextBox hexEditorArgs_TextBox;
        private Label hexEditorArgs_Label;
        private TextBox hexEditorPath_TextBox;
        private Button hexEditorBrowse_Button;
    }
}