namespace Ws2Explorer.Gui
{
    partial class InfoWindow
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
            dummy_Label = new Label();
            ok_Button = new Button();
            message_TextBox = new TextBox();
            SuspendLayout();
            // 
            // dummy_Label
            // 
            dummy_Label.AutoSize = true;
            dummy_Label.Font = new Font("Consolas", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            dummy_Label.Location = new Point(12, 9);
            dummy_Label.Name = "dummy_Label";
            dummy_Label.Size = new Size(0, 14);
            dummy_Label.TabIndex = 0;
            dummy_Label.Visible = false;
            // 
            // ok_Button
            // 
            ok_Button.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            ok_Button.Location = new Point(713, 415);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 1;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // message_TextBox
            // 
            message_TextBox.Font = new Font("Consolas", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            message_TextBox.Location = new Point(12, 12);
            message_TextBox.Multiline = true;
            message_TextBox.Name = "message_TextBox";
            message_TextBox.ReadOnly = true;
            message_TextBox.ScrollBars = ScrollBars.Both;
            message_TextBox.Size = new Size(100, 23);
            message_TextBox.TabIndex = 2;
            message_TextBox.WordWrap = false;
            // 
            // InfoWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(message_TextBox);
            Controls.Add(ok_Button);
            Controls.Add(dummy_Label);
            MinimizeBox = false;
            Name = "InfoWindow";
            ClientSizeChanged += InfoForm_ClientSizeChanged;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label dummy_Label;
        private Button ok_Button;
        private TextBox message_TextBox;
    }
}