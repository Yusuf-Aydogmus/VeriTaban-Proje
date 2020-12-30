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
    public partial class Ası : Form
    {
        public Ası()
        {
            InitializeComponent();
        }
        
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dr = new DialogResult();
            dr = MessageBox.Show("Asi Kaydını silmek istediğinizden emin misiniz ?", "Bilgi", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"Asi\" where \"asiNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtAsiNumarasi.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Asi Kaydı başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update  public.\"Asi\" set \"asiAdi\"=@p2,\"asiUcreti\"=@p3 where \"asiNo\"=@p1 ", baglanti);
            komut3.Parameters.AddWithValue("@p1", Convert.ToInt32(txtAsiNumarasi.Text));
            komut3.Parameters.AddWithValue("@p2", txtAsiAdi.Text);
            komut3.Parameters.AddWithValue("@p3", Convert.ToInt32(txtAsiUcreti.Text));

            komut3.ExecuteNonQuery();

            MessageBox.Show("Asi Kaydı güncelleme işlemi başarılı bir şekilde gerçekleşti", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"Asi\" (\"asiNo\",\"asiAdi\",\"asiUcreti\") values(@p1,@p2,@p3)", baglanti);

            komut.Parameters.AddWithValue("@p1", Convert.ToInt32(txtAsiNumarasi.Text));
            komut.Parameters.AddWithValue("@p2", txtAsiAdi.Text);
            komut.Parameters.AddWithValue("@p3", Convert.ToInt32(txtAsiUcreti.Text));

            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Asi Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");
        private void button1_Click(object sender, EventArgs e)
        {
            string sorgu = " select * from  public.\"Asi\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];




        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void Ası_Load(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu0 = " select * from  public.\"HayvanAsiOlma\"";
            NpgsqlDataAdapter da0 = new NpgsqlDataAdapter(sorgu0, baglanti);
            DataSet ds0 = new DataSet();
            da0.Fill(ds0);
            dataGridView2.DataSource = ds0.Tables[0];
            baglanti.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"HayvanAsiOlma\" (\"hayvanNo\",\"asiNo\") values(@p1,@p2)", baglanti);

            komut.Parameters.AddWithValue("@p1", Convert.ToInt32(txtHayvanNo.Text));
            komut.Parameters.AddWithValue("@p2", Convert.ToInt32(txtHayvanAsiNo.Text));


            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Asi Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            DialogResult dr = new DialogResult();
            dr = MessageBox.Show("Asi Kaydını silmek istediğinizden emin misiniz ?", "Bilgi", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"HayvanAsiOlma\" where \"hayvanAsiNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtHANumarasi.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Asi Kaydi başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }
    }
}
