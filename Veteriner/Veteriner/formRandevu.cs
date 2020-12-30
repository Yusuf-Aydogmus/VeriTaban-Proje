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
    public partial class formRandevu : Form
    {
        public formRandevu()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu = " select * from  public.\"Randevu\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //baglanti.Open();
            //NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"Randevu\" (\"randevuTarihi\",\"soyadi\",\"telNo\",\"adres\") values(@p1,@p2,@p3,@p4)", baglanti);

            //komut.Parameters.AddWithValue("@p1", txtAdi.Text);
            //komut.Parameters.AddWithValue("@p2", txtSoyadi.Text);
            //komut.Parameters.AddWithValue("@p3", txtTelNo.Text);
            //komut.Parameters.AddWithValue("@p4", txtAdres.Text);

            //komut.ExecuteNonQuery();
            //baglanti.Close();
            //MessageBox.Show("Sahip Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
