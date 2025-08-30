namespace Ws2Explorer.Gui
{
    partial class MeasurementWindow
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
            SuspendLayout();
            // 
            // message_Label
            // 
            message_Label.BackColor = Color.Transparent;
            message_Label.Dock = DockStyle.Fill;
            message_Label.Font = new Font("Segoe UI", 20F);
            message_Label.Location = new Point(0, 0);
            message_Label.Name = "message_Label";
            message_Label.Size = new Size(823, 210);
            message_Label.TabIndex = 0;
            message_Label.Text = "Resize me!";
            message_Label.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // MeasurementWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(823, 210);
            Controls.Add(message_Label);
            Name = "MeasurementWindow";
            Text = "Pixel Measurement Tool";
            TopMost = true;
            ClientSizeChanged += OnClientSizeChanged;
            ResumeLayout(false);
        }

        #endregion

        private Label message_Label;
    }
}