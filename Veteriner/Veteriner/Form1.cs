using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Veteriner
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");
        private void Form1_Load(object sender, EventArgs e)
        {
           
            

            

            //baglanti.Open();
            //string sorgu2 = " select * from public.\"HayvanTuru\"";
            //NpgsqlDataAdapter da2 = new NpgsqlDataAdapter(sorgu2, baglanti);
            //DataTable dt2 = new DataTable();
            //da2.Fill(dt2);

            //cbHayvanTürü.DisplayMember = "turAdi";
            //cbHayvanTürü.ValueMember = "turNo";
            //cbHayvanTürü.DataSource = dt2;
            //baglanti.Close();


            string sorgu3 = " select * from public.\"HayvanCinsi\"";
            NpgsqlDataAdapter da3 = new NpgsqlDataAdapter(sorgu3, baglanti);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);

            cbHayvanCinsi.DisplayMember = "cinsAdi";
            cbHayvanCinsi.ValueMember = "cinsNo";
            cbHayvanCinsi.DataSource = dt3;


            baglanti.Close();






        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

      

        private void label6_Click(object sender, EventArgs e)
        {

        }

      

    

        private void button6_Click(object sender, EventArgs e)
        {
            Test frm = new Test();
            frm.Show();
        }

        private void asıFormaGit_Click(object sender, EventArgs e)
        {
            Ası frm = new Ası();
            frm.Show();
        }

   

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
                 NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"Hayvan\" (\"sahipNo\",\"hayvanAdi\",\"hayvanYasi\",\"cinsNo\",\"ates\",\"veterinerNo\",\"cinsiyet\") values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", baglanti);
            
            komut.Parameters.AddWithValue("@p1", Convert.ToInt32(txtSahipNumarası.Text));
            komut.Parameters.AddWithValue("@p2", txtHayvanAdi.Text);
            komut.Parameters.AddWithValue("@p3", Convert.ToInt32(txtHayvanYaşi.Text));
            komut.Parameters.AddWithValue("@p4", Convert.ToInt32(txtCinsNumarası.Text));
            komut.Parameters.AddWithValue("@p5", Convert.ToInt32(txtHayvanAtes.Text));
            komut.Parameters.AddWithValue("@p6", Convert.ToInt32(txtVeterinerNumarası.Text));
            komut.Parameters.AddWithValue("@p7", txtCinsiyetNumarası.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Hayvan Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            textBox1.Text = " ";
            string sorgu = " select * from  public.\"Hayvan\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();

            string sorgu0 = " select * from public.\"Test\"";
            NpgsqlDataAdapter da0 = new NpgsqlDataAdapter(sorgu0, baglanti);
            DataTable dt0 = new DataTable();
            da0.Fill(dt0);

            
            baglanti.Close();

            baglanti.Open();
            string sorgu1 = " select * from public.\"Asi\"";
            NpgsqlDataAdapter da1 = new NpgsqlDataAdapter(sorgu1, baglanti);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);

           
            baglanti.Close();



        }
       
        private void cbHayvanCinsi_SelectedIndexChanged(object sender, EventArgs e)
        {
           // cbHayvanCinsi.SelectedValue.
        }
              string a;
            int b;
        private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            Sahip sahipForm = new Sahip();
            Cins cinsForm = new Cins();
            Tur turForm = new Tur();
            
            txtHayvanNumarası.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtHayvanAdi.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            txtSahipNumarası.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtHayvanYaşi.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
           txtCinsNumarası.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            txtHayvanAtes.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            txtVeterinerNumarası.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            txtCinsiyetNumarası.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();

            a = txtCinsNumarası.Text;
            b = Convert.ToInt32(a) - 1;


            cbHayvanCinsi.Text = cinsForm.dataGridView1.Rows[b].Cells[1].Value.ToString();


           
           
            //cbHayvanCinsi.DisplayMember = "cinsAdi";
            //cbHayvanCinsi.ValueMember = "cinsNo";
            //cbHayvanCinsi.DataSource = dt4;
          

            a = txtSahipNumarası.Text;
            b = Convert.ToInt32(a)-1;
          //  txtSahipAdi.Text=sahipForm.dataGridView2.Rows[b].Cells[1].Value.ToString();
            baglanti.Close();
          



        }

        private void button8_Click(object sender, EventArgs e)
        {

            Sahip sahipForm = new Sahip();
            sahipForm.Show();

        }

        private void button9_Click(object sender, EventArgs e)
        {
            Cins cinsForm = new Cins();
            cinsForm.Show();

        }

        private void button10_Click(object sender, EventArgs e)
        {
            Tur turForm = new Tur();
            turForm.Show();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void txtHayvanAtes_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCinsNumarası_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            
            DialogResult dr = new DialogResult();
           dr= MessageBox.Show("Hayvan Kaydını silmek istediğinizden emin misiniz ?","Bilgi",MessageBoxButtons.YesNoCancel,MessageBoxIcon.Question);

            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"Hayvan\" where \"hayvanNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtHayvanNumarası.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Hayvan Kaydı başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update  public.\"Hayvan\" set \"hayvanAdi\"=@p2, \"sahipNo\"=@p1, \"hayvanYasi\"=@p3, \"cinsNo\"=@p4, \"ates\"=@p5, \"veterinerNo\"=@p6, \"cinsiyet\"=@p7  where \"hayvanNo\"=@p8", baglanti);
            komut3.Parameters.AddWithValue("@p1", Convert.ToInt32(txtSahipNumarası.Text));
            komut3.Parameters.AddWithValue("@p2", txtHayvanAdi.Text);
            komut3.Parameters.AddWithValue("@p3", Convert.ToInt32(txtHayvanYaşi.Text));
            komut3.Parameters.AddWithValue("@p4", Convert.ToInt32(txtCinsNumarası.Text));
            komut3.Parameters.AddWithValue("@p5", Convert.ToInt32(txtHayvanAtes.Text));
            komut3.Parameters.AddWithValue("@p6", Convert.ToInt32(txtVeterinerNumarası.Text));
            komut3.Parameters.AddWithValue("@p7", txtCinsiyetNumarası.Text);
            komut3.Parameters.AddWithValue("@p8", int.Parse(txtHayvanNumarası.Text));
            komut3.ExecuteNonQuery();

            MessageBox.Show("Hayvan Kaydı güncelleme işlemi başarılı bir şekilde gerçekleşti", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            baglanti.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
            baglanti.Open();
            DataTable dt3 = new DataTable();

            string sorgu3 = "select * from public.\"Hayvan\"  where  \"hayvanAdi\" like '%" + textBox1.Text + "%' ";
            NpgsqlDataAdapter ara = new NpgsqlDataAdapter(sorgu3, baglanti);
           
            ara.Fill(dt3);
            baglanti.Close();
            dataGridView1.DataSource = dt3;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button11_Click(object sender, EventArgs e)
        {
           
        }

        private void button6_Click_1(object sender, EventArgs e)
        {
         

        }

        private void button11_Click_1(object sender, EventArgs e)
        {
            formRandevu formrandevu = new formRandevu();
            formrandevu.Show();
        }
    }
}
