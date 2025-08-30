namespace Ws2Explorer.Gui
{
    partial class WordWrapWindow
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
            pixels_Radio = new RadioButton();
            chars_Radio = new RadioButton();
            chars_TextBox = new TextBox();
            pixels_TextBox = new TextBox();
            font_TextBox = new TextBox();
            fontBrowse_Button = new Button();
            pixels_GroupBox = new GroupBox();
            fontSize_TextBox = new TextBox();
            fontSize_Label = new Label();
            px_Label = new Label();
            bold_CheckBox = new CheckBox();
            italic_CheckBox = new CheckBox();
            fontPath_Label = new Label();
            pixelWidth_Label = new Label();
            removeExistingNewlines_CheckBox = new CheckBox();
            measure_Button = new Button();
            cancel_Button = new Button();
            ok_Button = new Button();
            chars_GroupBox = new GroupBox();
            chars_Label = new Label();
            charWidth_Label = new Label();
            maxLines_Label = new Label();
            maxLines_TextBox = new TextBox();
            pixels_GroupBox.SuspendLayout();
            chars_GroupBox.SuspendLayout();
            SuspendLayout();
            // 
            // pixels_Radio
            // 
            pixels_Radio.AutoSize = true;
            pixels_Radio.Checked = true;
            pixels_Radio.Location = new Point(12, 12);
            pixels_Radio.Name = "pixels_Radio";
            pixels_Radio.Size = new Size(144, 19);
            pixels_Radio.TabIndex = 0;
            pixels_Radio.TabStop = true;
            pixels_Radio.Text = "Pixels (recommended)";
            pixels_Radio.UseVisualStyleBackColor = true;
            pixels_Radio.CheckedChanged += PixelsChars_RadioCheckChanged;
            // 
            // chars_Radio
            // 
            chars_Radio.AutoSize = true;
            chars_Radio.Location = new Point(12, 190);
            chars_Radio.Name = "chars_Radio";
            chars_Radio.Size = new Size(81, 19);
            chars_Radio.TabIndex = 1;
            chars_Radio.Text = "Characters";
            chars_Radio.UseVisualStyleBackColor = true;
            chars_Radio.CheckedChanged += PixelsChars_RadioCheckChanged;
            // 
            // chars_TextBox
            // 
            chars_TextBox.Location = new Point(370, 20);
            chars_TextBox.Name = "chars_TextBox";
            chars_TextBox.Size = new Size(61, 23);
            chars_TextBox.TabIndex = 2;
            chars_TextBox.Text = "24";
            chars_TextBox.TextAlign = HorizontalAlignment.Right;
            // 
            // pixels_TextBox
            // 
            pixels_TextBox.Location = new Point(362, 22);
            pixels_TextBox.Name = "pixels_TextBox";
            pixels_TextBox.Size = new Size(69, 23);
            pixels_TextBox.TabIndex = 3;
            pixels_TextBox.Text = "400";
            pixels_TextBox.TextAlign = HorizontalAlignment.Right;
            // 
            // font_TextBox
            // 
            font_TextBox.Location = new Point(97, 51);
            font_TextBox.Name = "font_TextBox";
            font_TextBox.Size = new Size(334, 23);
            font_TextBox.TabIndex = 4;
            // 
            // fontBrowse_Button
            // 
            fontBrowse_Button.Location = new Point(437, 51);
            fontBrowse_Button.Name = "fontBrowse_Button";
            fontBrowse_Button.Size = new Size(46, 23);
            fontBrowse_Button.TabIndex = 5;
            fontBrowse_Button.Text = "...";
            fontBrowse_Button.UseVisualStyleBackColor = true;
            fontBrowse_Button.Click += FontBrowse_ButtonClicked;
            // 
            // pixels_GroupBox
            // 
            pixels_GroupBox.Controls.Add(fontSize_TextBox);
            pixels_GroupBox.Controls.Add(fontSize_Label);
            pixels_GroupBox.Controls.Add(px_Label);
            pixels_GroupBox.Controls.Add(bold_CheckBox);
            pixels_GroupBox.Controls.Add(italic_CheckBox);
            pixels_GroupBox.Controls.Add(fontPath_Label);
            pixels_GroupBox.Controls.Add(pixelWidth_Label);
            pixels_GroupBox.Controls.Add(font_TextBox);
            pixels_GroupBox.Controls.Add(pixels_TextBox);
            pixels_GroupBox.Controls.Add(fontBrowse_Button);
            pixels_GroupBox.Location = new Point(12, 37);
            pixels_GroupBox.Name = "pixels_GroupBox";
            pixels_GroupBox.Size = new Size(495, 147);
            pixels_GroupBox.TabIndex = 6;
            pixels_GroupBox.TabStop = false;
            // 
            // fontSize_TextBox
            // 
            fontSize_TextBox.Location = new Point(362, 80);
            fontSize_TextBox.Name = "fontSize_TextBox";
            fontSize_TextBox.Size = new Size(69, 23);
            fontSize_TextBox.TabIndex = 11;
            fontSize_TextBox.Text = "18";
            fontSize_TextBox.TextAlign = HorizontalAlignment.Right;
            // 
            // fontSize_Label
            // 
            fontSize_Label.AutoSize = true;
            fontSize_Label.Location = new Point(6, 84);
            fontSize_Label.Name = "fontSize_Label";
            fontSize_Label.Size = new Size(53, 15);
            fontSize_Label.TabIndex = 10;
            fontSize_Label.Text = "Font size";
            // 
            // px_Label
            // 
            px_Label.AutoSize = true;
            px_Label.Location = new Point(437, 25);
            px_Label.Name = "px_Label";
            px_Label.Size = new Size(20, 15);
            px_Label.TabIndex = 9;
            px_Label.Text = "px";
            // 
            // bold_CheckBox
            // 
            bold_CheckBox.AutoSize = true;
            bold_CheckBox.Location = new Point(9, 114);
            bold_CheckBox.Name = "bold_CheckBox";
            bold_CheckBox.Size = new Size(50, 19);
            bold_CheckBox.TabIndex = 8;
            bold_CheckBox.Text = "Bold";
            bold_CheckBox.UseVisualStyleBackColor = true;
            // 
            // italic_CheckBox
            // 
            italic_CheckBox.AutoSize = true;
            italic_CheckBox.Location = new Point(65, 114);
            italic_CheckBox.Name = "italic_CheckBox";
            italic_CheckBox.Size = new Size(51, 19);
            italic_CheckBox.TabIndex = 7;
            italic_CheckBox.Text = "Italic";
            italic_CheckBox.UseVisualStyleBackColor = true;
            // 
            // fontPath_Label
            // 
            fontPath_Label.AutoSize = true;
            fontPath_Label.Location = new Point(6, 54);
            fontPath_Label.Name = "fontPath_Label";
            fontPath_Label.Size = new Size(58, 15);
            fontPath_Label.TabIndex = 6;
            fontPath_Label.Text = "Font path";
            // 
            // pixelWidth_Label
            // 
            pixelWidth_Label.AutoSize = true;
            pixelWidth_Label.Location = new Point(6, 25);
            pixelWidth_Label.Name = "pixelWidth_Label";
            pixelWidth_Label.Size = new Size(85, 15);
            pixelWidth_Label.TabIndex = 5;
            pixelWidth_Label.Text = "Max line width";
            // 
            // removeExistingNewlines_CheckBox
            // 
            removeExistingNewlines_CheckBox.AutoSize = true;
            removeExistingNewlines_CheckBox.Checked = true;
            removeExistingNewlines_CheckBox.CheckState = CheckState.Checked;
            removeExistingNewlines_CheckBox.Location = new Point(12, 314);
            removeExistingNewlines_CheckBox.Name = "removeExistingNewlines_CheckBox";
            removeExistingNewlines_CheckBox.Size = new Size(162, 19);
            removeExistingNewlines_CheckBox.TabIndex = 7;
            removeExistingNewlines_CheckBox.Text = "Remove existing newlines";
            removeExistingNewlines_CheckBox.UseVisualStyleBackColor = true;
            // 
            // measure_Button
            // 
            measure_Button.Location = new Point(295, 12);
            measure_Button.Name = "measure_Button";
            measure_Button.Size = new Size(212, 23);
            measure_Button.TabIndex = 8;
            measure_Button.Text = "Open Pixel Measurement Tool";
            measure_Button.UseVisualStyleBackColor = true;
            measure_Button.Click += Measure_ButtonClicked;
            // 
            // cancel_Button
            // 
            cancel_Button.Location = new Point(432, 343);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 9;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // ok_Button
            // 
            ok_Button.Location = new Point(351, 343);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 10;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // chars_GroupBox
            // 
            chars_GroupBox.Controls.Add(chars_Label);
            chars_GroupBox.Controls.Add(charWidth_Label);
            chars_GroupBox.Controls.Add(chars_TextBox);
            chars_GroupBox.Location = new Point(12, 215);
            chars_GroupBox.Name = "chars_GroupBox";
            chars_GroupBox.Size = new Size(495, 53);
            chars_GroupBox.TabIndex = 11;
            chars_GroupBox.TabStop = false;
            // 
            // chars_Label
            // 
            chars_Label.AutoSize = true;
            chars_Label.Location = new Point(437, 23);
            chars_Label.Name = "chars_Label";
            chars_Label.Size = new Size(35, 15);
            chars_Label.TabIndex = 10;
            chars_Label.Text = "chars";
            // 
            // charWidth_Label
            // 
            charWidth_Label.AutoSize = true;
            charWidth_Label.Location = new Point(6, 23);
            charWidth_Label.Name = "charWidth_Label";
            charWidth_Label.Size = new Size(85, 15);
            charWidth_Label.TabIndex = 6;
            charWidth_Label.Text = "Max line width";
            // 
            // maxLines_Label
            // 
            maxLines_Label.AutoSize = true;
            maxLines_Label.Location = new Point(12, 347);
            maxLines_Label.Name = "maxLines_Label";
            maxLines_Label.Size = new Size(168, 15);
            maxLines_Label.TabIndex = 12;
            maxLines_Label.Text = "Warn when line count exceeds";
            // 
            // maxLines_TextBox
            // 
            maxLines_TextBox.Location = new Point(186, 343);
            maxLines_TextBox.Name = "maxLines_TextBox";
            maxLines_TextBox.Size = new Size(63, 23);
            maxLines_TextBox.TabIndex = 13;
            maxLines_TextBox.Text = "4";
            maxLines_TextBox.TextAlign = HorizontalAlignment.Right;
            // 
            // WordWrapWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(525, 379);
            Controls.Add(maxLines_TextBox);
            Controls.Add(maxLines_Label);
            Controls.Add(chars_GroupBox);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            Controls.Add(measure_Button);
            Controls.Add(removeExistingNewlines_CheckBox);
            Controls.Add(pixels_GroupBox);
            Controls.Add(chars_Radio);
            Controls.Add(pixels_Radio);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            Name = "WordWrapWindow";
            Text = "Word Wrap";
            pixels_GroupBox.ResumeLayout(false);
            pixels_GroupBox.PerformLayout();
            chars_GroupBox.ResumeLayout(false);
            chars_GroupBox.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private RadioButton pixels_Radio;
        private RadioButton chars_Radio;
        private TextBox chars_TextBox;
        private TextBox pixels_TextBox;
        private TextBox font_TextBox;
        private Button fontBrowse_Button;
        private GroupBox pixels_GroupBox;
        private CheckBox removeExistingNewlines_CheckBox;
        private Button measure_Button;
        private Button cancel_Button;
        private Button ok_Button;
        private GroupBox chars_GroupBox;
        private Label px_Label;
        private CheckBox bold_CheckBox;
        private CheckBox italic_CheckBox;
        private Label fontPath_Label;
        private Label pixelWidth_Label;
        private Label chars_Label;
        private Label charWidth_Label;
        private Label maxLines_Label;
        private TextBox maxLines_TextBox;
        private TextBox fontSize_TextBox;
        private Label fontSize_Label;
    }
}