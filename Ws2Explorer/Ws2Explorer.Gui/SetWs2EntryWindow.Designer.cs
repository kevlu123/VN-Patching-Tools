namespace Ws2Explorer.Gui
{
    partial class SetWs2EntryWindow
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
            text_ComboBox = new ComboBox();
            ok_Button = new Button();
            cancel_Button = new Button();
            SuspendLayout();
            // 
            // text_ComboBox
            // 
            text_ComboBox.FormattingEnabled = true;
            text_ComboBox.Location = new Point(12, 11);
            text_ComboBox.Name = "text_ComboBox";
            text_ComboBox.Size = new Size(352, 23);
            text_ComboBox.TabIndex = 0;
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(208, 40);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 5;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
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
            // SetWs2EntryWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(375, 75);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            Controls.Add(text_ComboBox);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "SetWs2EntryWindow";
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Set WS2 Entry Point";
            ResumeLayout(false);
        }

        #endregion

        private ComboBox text_ComboBox;
        private Button ok_Button;
        private Button cancel_Button;
    }
}