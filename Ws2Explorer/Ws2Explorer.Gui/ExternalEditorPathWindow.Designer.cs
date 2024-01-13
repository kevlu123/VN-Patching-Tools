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
            label2 = new Label();
            label3 = new Label();
            imageEditorPathTextBox = new TextBox();
            hexEditorPathTextBox = new TextBox();
            button1 = new Button();
            button2 = new Button();
            textEditorPathBrowseButton = new Button();
            hexEditorPathBrowseButton = new Button();
            imageEditorPathBrowseButton = new Button();
            SuspendLayout();
            // 
            // textEditorPathTextBox
            // 
            textEditorPathTextBox.Location = new Point(138, 17);
            textEditorPathTextBox.Name = "textEditorPathTextBox";
            textEditorPathTextBox.Size = new Size(433, 23);
            textEditorPathTextBox.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(12, 20);
            label1.Name = "label1";
            label1.Size = new Size(89, 15);
            label1.TabIndex = 1;
            label1.Text = "Text Editor Path";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(12, 50);
            label2.Name = "label2";
            label2.Size = new Size(101, 15);
            label2.TabIndex = 2;
            label2.Text = "Image Editor Path";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(12, 80);
            label3.Name = "label3";
            label3.Size = new Size(89, 15);
            label3.TabIndex = 3;
            label3.Text = "Hex Editor Path";
            // 
            // imageEditorPathTextBox
            // 
            imageEditorPathTextBox.Location = new Point(138, 46);
            imageEditorPathTextBox.Name = "imageEditorPathTextBox";
            imageEditorPathTextBox.Size = new Size(433, 23);
            imageEditorPathTextBox.TabIndex = 4;
            // 
            // hexEditorPathTextBox
            // 
            hexEditorPathTextBox.Location = new Point(138, 75);
            hexEditorPathTextBox.Name = "hexEditorPathTextBox";
            hexEditorPathTextBox.Size = new Size(433, 23);
            hexEditorPathTextBox.TabIndex = 5;
            // 
            // button1
            // 
            button1.Location = new Point(538, 118);
            button1.Name = "button1";
            button1.Size = new Size(75, 23);
            button1.TabIndex = 6;
            button1.Text = "Cancel";
            button1.UseVisualStyleBackColor = true;
            button1.Click += CancelButtonClicked;
            // 
            // button2
            // 
            button2.Location = new Point(457, 118);
            button2.Name = "button2";
            button2.Size = new Size(75, 23);
            button2.TabIndex = 7;
            button2.Text = "OK";
            button2.UseVisualStyleBackColor = true;
            button2.Click += OkButtonClicked;
            // 
            // textEditorPathBrowseButton
            // 
            textEditorPathBrowseButton.Location = new Point(577, 16);
            textEditorPathBrowseButton.Name = "textEditorPathBrowseButton";
            textEditorPathBrowseButton.Size = new Size(36, 23);
            textEditorPathBrowseButton.TabIndex = 8;
            textEditorPathBrowseButton.Text = "...";
            textEditorPathBrowseButton.UseVisualStyleBackColor = true;
            textEditorPathBrowseButton.Click += BrowsePath;
            // 
            // hexEditorPathBrowseButton
            // 
            hexEditorPathBrowseButton.Location = new Point(577, 76);
            hexEditorPathBrowseButton.Name = "hexEditorPathBrowseButton";
            hexEditorPathBrowseButton.Size = new Size(36, 23);
            hexEditorPathBrowseButton.TabIndex = 9;
            hexEditorPathBrowseButton.Text = "...";
            hexEditorPathBrowseButton.UseVisualStyleBackColor = true;
            hexEditorPathBrowseButton.Click += BrowsePath;
            // 
            // imageEditorPathBrowseButton
            // 
            imageEditorPathBrowseButton.Location = new Point(577, 45);
            imageEditorPathBrowseButton.Name = "imageEditorPathBrowseButton";
            imageEditorPathBrowseButton.Size = new Size(36, 23);
            imageEditorPathBrowseButton.TabIndex = 10;
            imageEditorPathBrowseButton.Text = "...";
            imageEditorPathBrowseButton.UseVisualStyleBackColor = true;
            imageEditorPathBrowseButton.Click += BrowsePath;
            // 
            // ExternalEditorPathWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(625, 156);
            Controls.Add(imageEditorPathBrowseButton);
            Controls.Add(hexEditorPathBrowseButton);
            Controls.Add(textEditorPathBrowseButton);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(hexEditorPathTextBox);
            Controls.Add(imageEditorPathTextBox);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(textEditorPathTextBox);
            Name = "ExternalEditorPathWindow";
            Text = "External Editors";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox textEditorPathTextBox;
        private Label label1;
        private Label label2;
        private Label label3;
        private TextBox imageEditorPathTextBox;
        private TextBox hexEditorPathTextBox;
        private Button button1;
        private Button button2;
        private Button textEditorPathBrowseButton;
        private Button hexEditorPathBrowseButton;
        private Button imageEditorPathBrowseButton;
    }
}