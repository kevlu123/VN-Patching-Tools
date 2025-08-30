namespace Ws2Explorer.Gui
{
    partial class OverwriteWindow
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
            message_Label = new Label();
            overwrite_Button = new Button();
            skip_Button = new Button();
            rename_Button = new Button();
            cancel_Button = new Button();
            SuspendLayout();
            // 
            // message_Label
            // 
            message_Label.AutoSize = true;
            message_Label.Location = new Point(12, 18);
            message_Label.Name = "message_Label";
            message_Label.Size = new Size(0, 15);
            message_Label.TabIndex = 0;
            // 
            // overwrite_Button
            // 
            overwrite_Button.Location = new Point(12, 112);
            overwrite_Button.Name = "overwrite_Button";
            overwrite_Button.Size = new Size(75, 23);
            overwrite_Button.TabIndex = 1;
            overwrite_Button.Text = "Overwrite";
            overwrite_Button.UseVisualStyleBackColor = true;
            overwrite_Button.Click += Overwrite_ButtonClicked;
            // 
            // skip_Button
            // 
            skip_Button.Location = new Point(174, 112);
            skip_Button.Name = "skip_Button";
            skip_Button.Size = new Size(75, 23);
            skip_Button.TabIndex = 2;
            skip_Button.Text = "Skip";
            skip_Button.UseVisualStyleBackColor = true;
            skip_Button.Click += Skip_ButtonClicked;
            // 
            // rename_Button
            // 
            rename_Button.Location = new Point(93, 112);
            rename_Button.Name = "rename_Button";
            rename_Button.Size = new Size(75, 23);
            rename_Button.TabIndex = 3;
            rename_Button.Text = "Rename";
            rename_Button.UseVisualStyleBackColor = true;
            rename_Button.Click += Rename_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(255, 112);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 4;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // OverwriteWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(339, 145);
            Controls.Add(cancel_Button);
            Controls.Add(rename_Button);
            Controls.Add(skip_Button);
            Controls.Add(overwrite_Button);
            Controls.Add(message_Label);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "OverwriteWindow";
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Overwrite files";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label message_Label;
        private Button overwrite_Button;
        private Button skip_Button;
        private Button rename_Button;
        private Button cancel_Button;
    }
}