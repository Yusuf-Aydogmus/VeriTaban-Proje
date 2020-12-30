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
    public partial class Test : Form
    {
        public Test()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");
        private void Test_Load(object sender, EventArgs e)
        {
     

        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"Test\" (\"testNo\",\"testAdi\",\"testUcreti\") values(@p1,@p2,@p3)", baglanti);

            komut.Parameters.AddWithValue("@p1", Convert.ToInt32(txtTestNumarasi.Text));
            komut.Parameters.AddWithValue("@p2", txtTestAdi.Text);
            komut.Parameters.AddWithValue("@p3", Convert.ToInt32(txtTestUcreti.Text));
     
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Test Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu = " select * from  public.\"Test\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();

           



        }

        private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            txtTestNumarasi.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtTestAdi.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtTestUcreti.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dr = new DialogResult();
            dr = MessageBox.Show("Hayvan Kayd silmek istediğinizden emin misiniz ?", "Bilgi", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"Test\" where \"testNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtTestNumarasi.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Hayvan Kayd başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update  public.\"Test\" set \"testAdi\"=@p2,\"testUcreti\"=@p3 where \"testNo\"=@p1 ", baglanti);
            komut3.Parameters.AddWithValue("@p1", Convert.ToInt32(txtTestNumarasi.Text));
            komut3.Parameters.AddWithValue("@p2", txtTestAdi.Text);
            komut3.Parameters.AddWithValue("@p3", Convert.ToInt32(txtTestUcreti.Text));
            
            komut3.ExecuteNonQuery();

            MessageBox.Show("Hayvan Kaydı güncelleme işlemi başarılı bir şekilde gerçekleşti", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            baglanti.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu0 = " select * from  public.\"HayvanTestYapma\"";
            NpgsqlDataAdapter da0 = new NpgsqlDataAdapter(sorgu0, baglanti);
            DataSet ds0 = new DataSet();
            da0.Fill(ds0);
            dataGridView2.DataSource = ds0.Tables[0];
            baglanti.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"HayvanTestYapma\" (\"hayvanNo\",\"testNo\") values(@p1,@p2)", baglanti);

            komut.Parameters.AddWithValue("@p1", Convert.ToInt32(txthayvanTestYapmaNo.Text));
            komut.Parameters.AddWithValue("@p2", Convert.ToInt32(txthayvanTestNumarasi.Text));


            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Test Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            DialogResult dr = new DialogResult();
            dr = MessageBox.Show("Test Kaydini silmek istediğinizden emin misiniz ?", "Bilgi", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"HayvanTestYapma\" where \"hayvanTestNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtHayvanTestNumarasıı.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Test Kaydi başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void txtHayvanTestNumarasıı_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
    }
}
