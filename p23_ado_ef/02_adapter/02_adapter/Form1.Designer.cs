namespace _02_adapter
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            txtQuery = new TextBox();
            label1 = new Label();
            btnExec = new Button();
            dgvMain = new DataGridView();
            btnSync = new Button();
            ((System.ComponentModel.ISupportInitialize)dgvMain).BeginInit();
            SuspendLayout();
            // 
            // txtQuery
            // 
            txtQuery.Location = new Point(53, 97);
            txtQuery.Margin = new Padding(5);
            txtQuery.Name = "txtQuery";
            txtQuery.Size = new Size(1461, 57);
            txtQuery.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(51, 31);
            label1.Name = "label1";
            label1.Size = new Size(121, 50);
            label1.TabIndex = 1;
            label1.Text = "Query";
            // 
            // btnExec
            // 
            btnExec.Location = new Point(1046, 180);
            btnExec.Name = "btnExec";
            btnExec.Size = new Size(209, 68);
            btnExec.TabIndex = 2;
            btnExec.Text = "EXECUTE";
            btnExec.UseVisualStyleBackColor = true;
            btnExec.Click += btnExec_Click;
            // 
            // dgvMain
            // 
            dgvMain.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvMain.Location = new Point(55, 303);
            dgvMain.Name = "dgvMain";
            dgvMain.RowHeadersWidth = 82;
            dgvMain.Size = new Size(1459, 1075);
            dgvMain.TabIndex = 3;
            // 
            // btnSync
            // 
            btnSync.Location = new Point(1305, 180);
            btnSync.Name = "btnSync";
            btnSync.Size = new Size(209, 68);
            btnSync.TabIndex = 4;
            btnSync.Text = "SYNC";
            btnSync.UseVisualStyleBackColor = true;
            btnSync.Click += btnSync_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(20F, 50F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1567, 1422);
            Controls.Add(btnSync);
            Controls.Add(dgvMain);
            Controls.Add(btnExec);
            Controls.Add(label1);
            Controls.Add(txtQuery);
            Font = new Font("Segoe UI", 13.875F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Margin = new Padding(5);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dgvMain).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtQuery;
        private Label label1;
        private Button btnExec;
        private DataGridView dgvMain;
        private Button btnSync;
    }
}
