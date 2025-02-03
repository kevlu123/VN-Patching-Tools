namespace Ws2Explorer.Gui
{
    partial class FindReferencesWindow
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
            find_Button = new Button();
            cancel_Button = new Button();
            searchText_TextBox = new TextBox();
            caseSensitive_CheckBox = new CheckBox();
            SuspendLayout();
            // 
            // find_Button
            // 
            find_Button.Location = new Point(208, 40);
            find_Button.Name = "find_Button";
            find_Button.Size = new Size(75, 23);
            find_Button.TabIndex = 5;
            find_Button.Text = "Find";
            find_Button.UseVisualStyleBackColor = true;
            find_Button.Click += Find_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(289, 40);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 4;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // searchText_TextBox
            // 
            searchText_TextBox.Location = new Point(11, 11);
            searchText_TextBox.Name = "searchText_TextBox";
            searchText_TextBox.Size = new Size(353, 23);
            searchText_TextBox.TabIndex = 3;
            // 
            // caseSensitive_CheckBox
            // 
            caseSensitive_CheckBox.AutoSize = true;
            caseSensitive_CheckBox.Location = new Point(11, 44);
            caseSensitive_CheckBox.Name = "caseSensitive_CheckBox";
            caseSensitive_CheckBox.Size = new Size(100, 19);
            caseSensitive_CheckBox.TabIndex = 9;
            caseSensitive_CheckBox.Text = "Case Sensitive";
            caseSensitive_CheckBox.UseVisualStyleBackColor = true;
            // 
            // FindReferencesWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(375, 75);
            Controls.Add(caseSensitive_CheckBox);
            Controls.Add(find_Button);
            Controls.Add(cancel_Button);
            Controls.Add(searchText_TextBox);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "FindReferencesWindow";
            ShowInTaskbar = false;
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Find String References";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button find_Button;
        private Button cancel_Button;
        private TextBox searchText_TextBox;
        private CheckBox caseSensitive_CheckBox;
    }
}