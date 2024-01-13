namespace Ws2Explorer.Gui {
    partial class RenameWindow {
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
            filenameTextBox = new TextBox();
            button1 = new Button();
            button2 = new Button();
            SuspendLayout();
            // 
            // filenameTextBox
            // 
            filenameTextBox.Location = new Point(12, 12);
            filenameTextBox.Name = "filenameTextBox";
            filenameTextBox.Size = new Size(353, 23);
            filenameTextBox.TabIndex = 0;
            // 
            // button1
            // 
            button1.Location = new Point(290, 41);
            button1.Name = "button1";
            button1.Size = new Size(75, 23);
            button1.TabIndex = 1;
            button1.Text = "Cancel";
            button1.UseVisualStyleBackColor = true;
            button1.Click += CancelButtonClicked;
            // 
            // button2
            // 
            button2.Location = new Point(209, 41);
            button2.Name = "button2";
            button2.Size = new Size(75, 23);
            button2.TabIndex = 2;
            button2.Text = "Rename";
            button2.UseVisualStyleBackColor = true;
            button2.Click += RenameButtonClicked;
            // 
            // RenameWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(375, 75);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(filenameTextBox);
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "RenameWindow";
            ShowInTaskbar = false;
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Rename File";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox filenameTextBox;
        private Button button1;
        private Button button2;
    }
}