namespace Ws2Explorer.Gui
{
    partial class ModifyNamesWindow
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
            cancel_Button = new Button();
            ok_Button = new Button();
            names_DataGridView = new DataGridView();
            Column1 = new DataGridViewTextBoxColumn();
            Column2 = new DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)names_DataGridView).BeginInit();
            SuspendLayout();
            // 
            // cancel_Button
            // 
            cancel_Button.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            cancel_Button.Location = new Point(485, 339);
            cancel_Button.Name = "cancel_Button";
            cancel_Button.Size = new Size(75, 23);
            cancel_Button.TabIndex = 1;
            cancel_Button.Text = "Cancel";
            cancel_Button.UseVisualStyleBackColor = true;
            cancel_Button.Click += Cancel_ButtonClicked;
            // 
            // ok_Button
            // 
            ok_Button.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            ok_Button.Location = new Point(404, 339);
            ok_Button.Name = "ok_Button";
            ok_Button.Size = new Size(75, 23);
            ok_Button.TabIndex = 2;
            ok_Button.Text = "OK";
            ok_Button.UseVisualStyleBackColor = true;
            ok_Button.Click += OK_ButtonClicked;
            // 
            // names_DataGridView
            // 
            names_DataGridView.AllowUserToAddRows = false;
            names_DataGridView.AllowUserToDeleteRows = false;
            names_DataGridView.AllowUserToResizeColumns = false;
            names_DataGridView.AllowUserToResizeRows = false;
            names_DataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            names_DataGridView.Columns.AddRange(new DataGridViewColumn[] { Column1, Column2 });
            names_DataGridView.EditMode = DataGridViewEditMode.EditOnKeystroke;
            names_DataGridView.Location = new Point(12, 12);
            names_DataGridView.Name = "names_DataGridView";
            names_DataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            names_DataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            names_DataGridView.Size = new Size(548, 321);
            names_DataGridView.TabIndex = 3;
            // 
            // Column1
            // 
            Column1.HeaderText = "Old Name";
            Column1.Name = "Column1";
            Column1.ReadOnly = true;
            Column1.Resizable = DataGridViewTriState.False;
            Column1.SortMode = DataGridViewColumnSortMode.NotSortable;
            // 
            // Column2
            // 
            Column2.HeaderText = "New Name";
            Column2.Name = "Column2";
            Column2.Resizable = DataGridViewTriState.False;
            Column2.SortMode = DataGridViewColumnSortMode.NotSortable;
            // 
            // ModifyNamesWindow
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(572, 374);
            Controls.Add(names_DataGridView);
            Controls.Add(ok_Button);
            Controls.Add(cancel_Button);
            MinimizeBox = false;
            Name = "ModifyNamesWindow";
            Text = "Modify Names";
            ClientSizeChanged += ModifyNamesForm_ClientSizeChanged;
            ((System.ComponentModel.ISupportInitialize)names_DataGridView).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Button cancel_Button;
        private Button ok_Button;
        private DataGridView names_DataGridView;
        private DataGridViewTextBoxColumn Column1;
        private DataGridViewTextBoxColumn Column2;
    }
}