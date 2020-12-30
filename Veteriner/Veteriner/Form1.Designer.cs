namespace Veteriner
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtHayvanNumarası = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.txtHayvanAdi = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtSahipNumarası = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtHayvanYaşi = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.testFormaGit = new System.Windows.Forms.Button();
            this.asıFormaGit = new System.Windows.Forms.Button();
            this.txtAtes = new System.Windows.Forms.Label();
            this.txtHayvanAtes = new System.Windows.Forms.TextBox();
            this.cbHayvanCinsi = new System.Windows.Forms.ComboBox();
            this.labelVeterinerNumarası = new System.Windows.Forms.Label();
            this.txtVeterinerNumarası = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtCinsiyetNumarası = new System.Windows.Forms.TextBox();
            this.button8 = new System.Windows.Forms.Button();
            this.button9 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.button10 = new System.Windows.Forms.Button();
            this.txtCinsNumarası = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 72);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(796, 281);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellEnter);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(845, 71);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(120, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Hayvan Numarası";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // txtHayvanNumarası
            // 
            this.txtHayvanNumarası.Location = new System.Drawing.Point(989, 68);
            this.txtHayvanNumarası.Name = "txtHayvanNumarası";
            this.txtHayvanNumarası.Size = new System.Drawing.Size(100, 22);
            this.txtHayvanNumarası.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1219, 118);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(100, 46);
            this.button1.TabIndex = 3;
            this.button1.Text = "Listele";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(1113, 118);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(100, 46);
            this.button2.TabIndex = 6;
            this.button2.Text = "Ekle";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(1113, 170);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(100, 46);
            this.button3.TabIndex = 8;
            this.button3.Text = "Sil";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(1219, 170);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(100, 46);
            this.button4.TabIndex = 7;
            this.button4.Text = "Güncelle";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(1259, 222);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(60, 43);
            this.button5.TabIndex = 9;
            this.button5.Text = "Ara";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // txtHayvanAdi
            // 
            this.txtHayvanAdi.Location = new System.Drawing.Point(989, 96);
            this.txtHayvanAdi.Name = "txtHayvanAdi";
            this.txtHayvanAdi.Size = new System.Drawing.Size(100, 22);
            this.txtHayvanAdi.TabIndex = 11;
            this.txtHayvanAdi.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(845, 99);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(80, 17);
            this.label2.TabIndex = 10;
            this.label2.Text = "Hayvan Adı";
            this.label2.Click += new System.EventHandler(this.label2_Click_1);
            // 
            // txtSahipNumarası
            // 
            this.txtSahipNumarası.Location = new System.Drawing.Point(989, 122);
            this.txtSahipNumarası.Name = "txtSahipNumarası";
            this.txtSahipNumarası.Size = new System.Drawing.Size(100, 22);
            this.txtSahipNumarası.TabIndex = 13;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(845, 125);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(108, 17);
            this.label3.TabIndex = 12;
            this.label3.Text = "Sahip Numarası";
            // 
            // txtHayvanYaşi
            // 
            this.txtHayvanYaşi.Location = new System.Drawing.Point(989, 153);
            this.txtHayvanYaşi.Name = "txtHayvanYaşi";
            this.txtHayvanYaşi.Size = new System.Drawing.Size(100, 22);
            this.txtHayvanYaşi.TabIndex = 18;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(845, 156);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(87, 17);
            this.label6.TabIndex = 17;
            this.label6.Text = "Hayvan Yaşı";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // testFormaGit
            // 
            this.testFormaGit.Location = new System.Drawing.Point(41, 426);
            this.testFormaGit.Name = "testFormaGit";
            this.testFormaGit.Size = new System.Drawing.Size(163, 35);
            this.testFormaGit.TabIndex = 25;
            this.testFormaGit.Text = "Test";
            this.testFormaGit.UseVisualStyleBackColor = true;
            this.testFormaGit.Click += new System.EventHandler(this.button6_Click);
            // 
            // asıFormaGit
            // 
            this.asıFormaGit.Location = new System.Drawing.Point(210, 426);
            this.asıFormaGit.Name = "asıFormaGit";
            this.asıFormaGit.Size = new System.Drawing.Size(142, 35);
            this.asıFormaGit.TabIndex = 26;
            this.asıFormaGit.Text = "Aşı";
            this.asıFormaGit.UseVisualStyleBackColor = true;
            this.asıFormaGit.Click += new System.EventHandler(this.asıFormaGit_Click);
            // 
            // txtAtes
            // 
            this.txtAtes.AutoSize = true;
            this.txtAtes.Location = new System.Drawing.Point(845, 239);
            this.txtAtes.Name = "txtAtes";
            this.txtAtes.Size = new System.Drawing.Size(36, 17);
            this.txtAtes.TabIndex = 32;
            this.txtAtes.Text = "Ates";
            // 
            // txtHayvanAtes
            // 
            this.txtHayvanAtes.Location = new System.Drawing.Point(989, 242);
            this.txtHayvanAtes.Name = "txtHayvanAtes";
            this.txtHayvanAtes.Size = new System.Drawing.Size(100, 22);
            this.txtHayvanAtes.TabIndex = 31;
            this.txtHayvanAtes.TextChanged += new System.EventHandler(this.txtHayvanAtes_TextChanged);
            // 
            // cbHayvanCinsi
            // 
            this.cbHayvanCinsi.FormattingEnabled = true;
            this.cbHayvanCinsi.Location = new System.Drawing.Point(989, 212);
            this.cbHayvanCinsi.Name = "cbHayvanCinsi";
            this.cbHayvanCinsi.Size = new System.Drawing.Size(100, 24);
            this.cbHayvanCinsi.TabIndex = 33;
            this.cbHayvanCinsi.SelectedIndexChanged += new System.EventHandler(this.cbHayvanCinsi_SelectedIndexChanged);
            // 
            // labelVeterinerNumarası
            // 
            this.labelVeterinerNumarası.AutoSize = true;
            this.labelVeterinerNumarası.Location = new System.Drawing.Point(845, 269);
            this.labelVeterinerNumarası.Name = "labelVeterinerNumarası";
            this.labelVeterinerNumarası.Size = new System.Drawing.Size(130, 17);
            this.labelVeterinerNumarası.TabIndex = 39;
            this.labelVeterinerNumarası.Text = "Veteriner Numarası";
            // 
            // txtVeterinerNumarası
            // 
            this.txtVeterinerNumarası.Location = new System.Drawing.Point(989, 270);
            this.txtVeterinerNumarası.Name = "txtVeterinerNumarası";
            this.txtVeterinerNumarası.Size = new System.Drawing.Size(100, 22);
            this.txtVeterinerNumarası.TabIndex = 38;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(845, 297);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(121, 17);
            this.label7.TabIndex = 41;
            this.label7.Text = "Cinsiyet Numarası";
            // 
            // txtCinsiyetNumarası
            // 
            this.txtCinsiyetNumarası.Location = new System.Drawing.Point(989, 298);
            this.txtCinsiyetNumarası.Name = "txtCinsiyetNumarası";
            this.txtCinsiyetNumarası.Size = new System.Drawing.Size(100, 22);
            this.txtCinsiyetNumarası.TabIndex = 40;
            // 
            // button8
            // 
            this.button8.Location = new System.Drawing.Point(370, 426);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(142, 35);
            this.button8.TabIndex = 42;
            this.button8.Text = "Sahip";
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // button9
            // 
            this.button9.Location = new System.Drawing.Point(518, 426);
            this.button9.Name = "button9";
            this.button9.Size = new System.Drawing.Size(142, 35);
            this.button9.TabIndex = 44;
            this.button9.Text = "Cins";
            this.button9.UseVisualStyleBackColor = true;
            this.button9.Click += new System.EventHandler(this.button9_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(845, 208);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(59, 17);
            this.label5.TabIndex = 45;
            this.label5.Text = "Cins Adı";
            // 
            // button10
            // 
            this.button10.Location = new System.Drawing.Point(666, 426);
            this.button10.Name = "button10";
            this.button10.Size = new System.Drawing.Size(142, 35);
            this.button10.TabIndex = 47;
            this.button10.Text = "Tür";
            this.button10.UseVisualStyleBackColor = true;
            this.button10.Click += new System.EventHandler(this.button10_Click);
            // 
            // txtCinsNumarası
            // 
            this.txtCinsNumarası.Location = new System.Drawing.Point(989, 181);
            this.txtCinsNumarası.Name = "txtCinsNumarası";
            this.txtCinsNumarası.Size = new System.Drawing.Size(100, 22);
            this.txtCinsNumarası.TabIndex = 49;
            this.txtCinsNumarası.TextChanged += new System.EventHandler(this.txtCinsNumarası_TextChanged);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(845, 181);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(99, 17);
            this.label8.TabIndex = 48;
            this.label8.Text = "Cins Numarası";
            this.label8.Click += new System.EventHandler(this.label8_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(1113, 225);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(140, 40);
            this.textBox1.TabIndex = 50;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1372, 610);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.txtCinsNumarası);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.button10);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.button9);
            this.Controls.Add(this.button8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtCinsiyetNumarası);
            this.Controls.Add(this.labelVeterinerNumarası);
            this.Controls.Add(this.txtVeterinerNumarası);
            this.Controls.Add(this.cbHayvanCinsi);
            this.Controls.Add(this.txtAtes);
            this.Controls.Add(this.txtHayvanAtes);
            this.Controls.Add(this.asıFormaGit);
            this.Controls.Add(this.testFormaGit);
            this.Controls.Add(this.txtHayvanYaşi);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtSahipNumarası);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtHayvanAdi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtHayvanNumarası);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.ShowInTaskbar = false;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtHayvanNumarası;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox txtHayvanAdi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtSahipNumarası;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtHayvanYaşi;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button testFormaGit;
        private System.Windows.Forms.Button asıFormaGit;
        private System.Windows.Forms.Label txtAtes;
        private System.Windows.Forms.TextBox txtHayvanAtes;
        private System.Windows.Forms.ComboBox cbHayvanCinsi;
        private System.Windows.Forms.Label labelVeterinerNumarası;
        private System.Windows.Forms.TextBox txtVeterinerNumarası;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtCinsiyetNumarası;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button button9;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button button10;
        private System.Windows.Forms.TextBox txtCinsNumarası;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox textBox1;
    }
}

