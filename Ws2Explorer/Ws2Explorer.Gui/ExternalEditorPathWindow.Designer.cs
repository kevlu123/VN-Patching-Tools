namespace Ws2Explorer.Gui {
    partial class ExternalEditorPathWindow {
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
        private void InitializeComponent() {
            textEditorPathTextBox = new TextBox();
            label1 = new Label();
            textEditorPathBrowseButton = new Button();
            textEditorArgsTextBox = new TextBox();
            label4 = new Label();
            groupBox1 = new GroupBox();
            button2 = new Button();
            button1 = new Button();
            groupBox2 = new GroupBox();
            label2 = new Label();
            imageEditorArgsTextBox = new TextBox();
            label3 = new Label();
            imageEditorPathTextBox = new TextBox();
            imageEditorPathBrowseButton = new Button();
            groupBox3 = new GroupBox();
            label5 = new Label();
            hexEditorArgsTextBox = new TextBox();
            label6 = new Label();
            hexEditorPathTextBox = new TextBox();
            hexEditorPathBrowseButton = new Button();
            groupBox1.SuspendLayout();
            groupBox2.SuspendLayout();
            groupBox3.SuspendLayout();
            SuspendLayout();
            // 
            // textEditorPathTextBox
            // 
            textEditorPathTextBox.Location = new Point(78, 17);
            textEditorPathTextBox.Name = "textEditorPathTextBox";
            textEditorPathTextBox.Size = new Size(475, 23);
            textEditorPathTextBox.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(6, 21);
            label1.Name = "label1";
            label1.Size = new Size(53, 15);
            label1.TabIndex = 1;
            label1.Text = "Program";
            // 
            // textEditorPathBrowseButton
            // 
            textEditorPathBrowseButton.Location = new Point(559, 17);
            textEditorPathBrowseButton.Name = "textEditorPathBrowseButton";
            textEditorPathBrowseButton.Size = new Size(36, 23);
            textEditorPathBrowseButton.TabIndex = 8;
            textEditorPathBrowseButton.Text = "...";
            textEditorPathBrowseButton.UseVisualStyleBackColor = true;
            textEditorPathBrowseButton.Click += BrowsePath;
            // 
            // textEditorArgsTextBox
            // 
            textEditorArgsTextBox.Location = new Point(78, 51);
            textEditorArgsTextBox.Name = "textEditorArgsTextBox";
            textEditorArgsTextBox.Size = new Size(517, 23);
            textEditorArgsTextBox.TabIndex = 11;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(6, 51);
            label4.Name = "label4";
            label4.Size = new Size(66, 15);
            label4.TabIndex = 12;
            label4.Text = "Arguments";
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(label1);
            groupBox1.Controls.Add(textEditorArgsTextBox);
            groupBox1.Controls.Add(label4);
            groupBox1.Controls.Add(textEditorPathTextBox);
            groupBox1.Controls.Add(textEditorPathBrowseButton);
            groupBox1.Location = new Point(12, 12);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(601, 86);
            groupBox1.TabIndex = 13;
            groupBox1.TabStop = false;
            groupBox1.Text = "Text Editor";
            // 
            // button2
            // 
            button2.Location = new Point(457, 288);
            button2.Name = "button2";
            button2.Size = new Size(75, 23);
            button2.TabIndex = 7;
            button2.Text = "OK";
            button2.UseVisualStyleBackColor = true;
            button2.Click += OkButtonClicked;
            // 
            // button1
            // 
            button1.Location = new Point(538, 288);
            button1.Name = "button1";
            button1.Size = new Size(75, 23);
            button1.TabIndex = 6;
            button1.Text = "Cancel";
            button1.UseVisualStyleBackColor = true;
            button1.Click += CancelButtonClicked;
            // 
            // groupBox2
            // 
            groupBox2.Controls.Add(label2);
            groupBox2.Controls.Add(imageEditorArgsTextBox);
            groupBox2.Controls.Add(label3);
            groupBox2.Controls.Add(imageEditorPathTextBox);
            groupBox2.Controls.Add(imageEditorPathBrowseButton);
            groupBox2.Location = new Point(12, 104);
            groupBox2.Name = "groupBox2";
            groupBox2.Size = new Size(601, 86);
            groupBox2.TabIndex = 14;
            groupBox2.TabStop = false;
            groupBox2.Text = "Image Editor";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(6, 21);
            label2.Name = "label2";
            label2.Size = new Size(53, 15);
            label2.TabIndex = 1;
            label2.Text = "Program";
            // 
            // imageEditorArgsTextBox
            // 
            imageEditorArgsTextBox.Location = new Point(78, 51);
            imageEditorArgsTextBox.Name = "imageEditorArgsTextBox";
            imageEditorArgsTextBox.Size = new Size(517, 23);
            imageEditorArgsTextBox.TabIndex = 11;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(6, 51);
            label3.Name = "label3";
            label3.Size = new Size(66, 15);
            label3.TabIndex = 12;
            label3.Text = "Arguments";
            // 
            // imageEditorPathTextBox
            // 
            imageEditorPathTextBox.Location = new Point(78, 17);
            imageEditorPathTextBox.Name = "imageEditorPathTextBox";
            imageEditorPathTextBox.Size = new Size(475, 23);
            imageEditorPathTextBox.TabIndex = 0;
            // 
            // imageEditorPathBrowseButton
            // 
            imageEditorPathBrowseButton.Location = new Point(559, 17);
            imageEditorPathBrowseButton.Name = "imageEditorPathBrowseButton";
            imageEditorPathBrowseButton.Size = new Size(36, 23);
            imageEditorPathBrowseButton.TabIndex = 8;
            imageEditorPathBrowseButton.Text = "...";
            imageEditorPathBrowseButton.UseVisualStyleBackColor = true;
            imageEditorPathBrowseButton.Click += BrowsePath;
            // 
            // groupBox3
            // 
            groupBox3.Controls.Add(label5);
            groupBox3.Controls.Add(hexEditorArgsTextBox);
            groupBox3.Controls.Add(label6);
            groupBox3.Controls.Add(hexEditorPathTextBox);
            groupBox3.Controls.Add(hexEditorPathBrowseButton);
            groupBox3.Location = new Point(12, 196);
            groupBox3.Name = "groupBox3";
            groupBox3.Size = new Size(601, 86);
            groupBox3.TabIndex = 14;
            groupBox3.TabStop = false;
            groupBox3.Text = "Hex Editor";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(6, 21);
            label5.Name = "label5";
            label5.Size = new Size(53, 15);
            label5.TabIndex = 1;
            label5.Text = "Program";
            // 
            // hexEditorArgsTextBox
            // 
            hexEditorArgsTextBox.Location = new Point(78, 51);
            hexEditorArgsTextBox.Name = "hexEditorArgsTextBox";
            hexEditorArgsTextBox.Size = new Size(517, 23);
            hexEditorArgsTextBox.TabIndex = 11;
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(6, 51);
            label6.Name = "label6";
            label6.Size = new Size(66, 15);
            label6.TabIndex = 12;
            label6.Text = "Arguments";
            // 
            // hexEditorPathTextBox
            // 
            hexEditorPathTextBox.Location = new Point(78, 17);
            hexEditorPathTextBox.Name = "hexEditorPathTextBox";
            hexEditorPathTextBox.Size = new Size(475, 23);
            hexEditorPathTextBox.TabIndex = 0;
            // 
            // hexEditorPathBrowseButton
            // 
            hexEditorPathBrowseButton.Location = new Point(559, 17);
            hexEditorPathBrowseButton.Name = "hexEditorPathBrowseButton";
            hexEditorPathBrowseButton.Size = new Size(36, 23);
            hexEditorPathBrowseButton.TabIndex = 8;
            hexEditorPathBrowseButton.Text = "...";
            hexEditorPathBrowseButton.UseVisualStyleBackColor = true;
            hexEditorPathBrowseButton.Click += BrowsePath;
            // 
            // ExternalEditorPathWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(626, 323);
            Controls.Add(groupBox3);
            Controls.Add(groupBox2);
            Controls.Add(groupBox1);
            Controls.Add(button2);
            Controls.Add(button1);
            Name = "ExternalEditorPathWindow";
            Text = "External Editors";
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            groupBox2.ResumeLayout(false);
            groupBox2.PerformLayout();
            groupBox3.ResumeLayout(false);
            groupBox3.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private TextBox textEditorPathTextBox;
        private Label label1;
        private Button textEditorPathBrowseButton;
        private TextBox textEditorArgsTextBox;
        private Label label4;
        private GroupBox groupBox1;
        private Button button2;
        private Button button1;
        private GroupBox groupBox2;
        private Label label2;
        private TextBox imageEditorArgsTextBox;
        private Label label3;
        private TextBox imageEditorPathTextBox;
        private Button imageEditorPathBrowseButton;
        private GroupBox groupBox3;
        private Label label5;
        private TextBox hexEditorArgsTextBox;
        private Label label6;
        private TextBox hexEditorPathTextBox;
        private Button hexEditorPathBrowseButton;
    }
}