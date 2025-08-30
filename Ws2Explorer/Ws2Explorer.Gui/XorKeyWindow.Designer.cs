namespace Ws2Explorer.Gui
{
    partial class XorKeyWindow
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
            key_TextBox = new TextBox();
            ok_Button = new Button();
            cancel_Button = new Button();
            key_Label = new Label();
            SuspendLayout();
            // 
            // key_TextBox
            // 
            key_TextBox.Location = new Point(69, 6);
            key_TextBox.Name = "key_TextBox";
            key_TextBox.Size = new Size(232, 23);
            key_TextBox.TabIndex = 3;
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(145, 35);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 4;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += Ok_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(226, 35);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 5;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // key_Label
            // 
            key_Label.AutoSize = true;
            key_Label.Location = new Point(12, 9);
            key_Label.Name = "key_Label";
            key_Label.Size = new Size(51, 15);
            key_Label.TabIndex = 6;
            key_Label.Text = "XOR key";
            // 
            // XorKeyWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(313, 69);
            Controls.Add(key_Label);
            Controls.Add(cancel_Button);
            Controls.Add(ok_Button);
            Controls.Add(key_TextBox);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "XorKeyWindow";
            SizeGripStyle = SizeGripStyle.Hide;
            Text = "Enter XOR key";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private TextBox key_TextBox;
        private Button ok_Button;
        private Button cancel_Button;
        private Label key_Label;
    }
}