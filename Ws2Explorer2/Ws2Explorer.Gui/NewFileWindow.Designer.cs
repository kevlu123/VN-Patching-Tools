namespace Ws2Explorer.Gui {
    partial class NewFileWindow
    {
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
            filename_TextBox = new TextBox();
            cancel_Button = new Button();
            ok_Button = new Button();
            SuspendLayout();
            // 
            // filename_TextBox
            // 
            filename_TextBox.Location = new Point(12, 12);
            filename_TextBox.Name = "filename_TextBox";
            filename_TextBox.Size = new Size(353, 23);
            filename_TextBox.TabIndex = 0;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(290, 41);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 1;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(209, 41);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 2;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // NewFileWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(375, 75);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            Controls.Add(filename_TextBox);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "NewFileWindow";
            ShowInTaskbar = false;
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "New File";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox filename_TextBox;
        private Button cancel_Button;
        private Button ok_Button;
    }
}