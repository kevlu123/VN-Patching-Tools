namespace Ws2Explorer.Gui
{
    partial class FlowchartWindow
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
            json_Radio = new RadioButton();
            mermaid_Radio = new RadioButton();
            format_GroupBox = new GroupBox();
            showAllArcs_CheckBox = new CheckBox();
            output_TextBox = new TextBox();
            format_GroupBox.SuspendLayout();
            SuspendLayout();
            // 
            // json_Radio
            // 
            json_Radio.AutoSize = true;
            json_Radio.Location = new Point(10, 47);
            json_Radio.Name = "json_Radio";
            json_Radio.Size = new Size(53, 19);
            json_Radio.TabIndex = 0;
            json_Radio.Text = "JSON";
            json_Radio.UseVisualStyleBackColor = true;
            json_Radio.CheckedChanged += FormatRadio_CheckChanged;
            // 
            // mermaid_Radio
            // 
            mermaid_Radio.AutoSize = true;
            mermaid_Radio.Checked = true;
            mermaid_Radio.Location = new Point(10, 22);
            mermaid_Radio.Name = "mermaid_Radio";
            mermaid_Radio.Size = new Size(73, 19);
            mermaid_Radio.TabIndex = 1;
            mermaid_Radio.TabStop = true;
            mermaid_Radio.Text = "Mermaid";
            mermaid_Radio.UseVisualStyleBackColor = true;
            mermaid_Radio.CheckedChanged += FormatRadio_CheckChanged;
            // 
            // format_GroupBox
            // 
            format_GroupBox.Controls.Add(json_Radio);
            format_GroupBox.Controls.Add(mermaid_Radio);
            format_GroupBox.Location = new Point(12, 12);
            format_GroupBox.Name = "format_GroupBox";
            format_GroupBox.Size = new Size(105, 81);
            format_GroupBox.TabIndex = 2;
            format_GroupBox.TabStop = false;
            format_GroupBox.Text = "Format";
            // 
            // showAllArcs_CheckBox
            // 
            showAllArcs_CheckBox.AutoSize = true;
            showAllArcs_CheckBox.Location = new Point(12, 99);
            showAllArcs_CheckBox.Name = "showAllArcs_CheckBox";
            showAllArcs_CheckBox.Size = new Size(94, 19);
            showAllArcs_CheckBox.TabIndex = 3;
            showAllArcs_CheckBox.Text = "Show all arcs";
            showAllArcs_CheckBox.UseVisualStyleBackColor = true;
            showAllArcs_CheckBox.CheckedChanged += ShowAllArcs_CheckChanged;
            // 
            // output_TextBox
            // 
            output_TextBox.Font = new Font("Consolas", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            output_TextBox.Location = new Point(123, 12);
            output_TextBox.Multiline = true;
            output_TextBox.Name = "output_TextBox";
            output_TextBox.ReadOnly = true;
            output_TextBox.ScrollBars = ScrollBars.Both;
            output_TextBox.Size = new Size(343, 317);
            output_TextBox.TabIndex = 4;
            output_TextBox.WordWrap = false;
            // 
            // FlowchartWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(482, 342);
            Controls.Add(output_TextBox);
            Controls.Add(showAllArcs_CheckBox);
            Controls.Add(format_GroupBox);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            Name = "FlowchartWindow";
            Text = "Flowchart";
            format_GroupBox.ResumeLayout(false);
            format_GroupBox.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private RadioButton json_Radio;
        private RadioButton mermaid_Radio;
        private GroupBox format_GroupBox;
        private CheckBox showAllArcs_CheckBox;
        private TextBox output_TextBox;
    }
}