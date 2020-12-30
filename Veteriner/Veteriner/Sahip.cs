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
    public partial class Sahip : Form
    {

        public Sahip()
        {
            InitializeComponent();
            
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");
        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
          
         
        }
        
        private void Sahip_Load(object sender, EventArgs e)
        {
            
        }

        private void Sahip_Leave(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu = " select * from  public.\"HayvanSahip\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut = new NpgsqlCommand("insert into public.\"HayvanSahip\" (\"adi\",\"soyadi\",\"telNo\",\"adres\") values(@p1,@p2,@p3,@p4)", baglanti);

            komut.Parameters.AddWithValue("@p1", txtAdi.Text);
            komut.Parameters.AddWithValue("@p2", txtSoyadi.Text);
            komut.Parameters.AddWithValue("@p3", txtTelNo.Text);
            komut.Parameters.AddWithValue("@p4", txtAdres.Text);

            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Sahip Eklendi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dr = new DialogResult();
            dr = MessageBox.Show("Sahip Kaydını silmek istediğinizden emin misiniz ?", "Bilgi", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

            if (dr == DialogResult.Yes)
            {
                baglanti.Open();
                NpgsqlCommand komut2 = new NpgsqlCommand("Delete from public.\"HayvanSahip\" where \"sahipNo\"=@p1", baglanti);
                komut2.Parameters.AddWithValue("@p1", int.Parse(txtSahipNo.Text));
                komut2.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Sahip Kaydı başarılı bir şekilde silindi", "Silindi", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update  public.\"HayvanSahip\" set \"adi\"=@p2,\"soyadi\"=@p3,\"telNo\"=@p4,\"adres\"=@p5 where \"testNo\"=@p1 ", baglanti);
            komut3.Parameters.AddWithValue("@p1", Convert.ToInt32(txtSahipNo.Text));
            komut3.Parameters.AddWithValue("@p2", txtAdi.Text);
            komut3.Parameters.AddWithValue("@p3",txtSoyadi.Text);
            komut3.Parameters.AddWithValue("@p4", txtTelNo.Text);
            komut3.Parameters.AddWithValue("@p5", txtAdres.Text);

            komut3.ExecuteNonQuery();

            MessageBox.Show("Sahip Kaydı güncelleme işlemi başarılı bir şekilde gerçekleşti", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            baglanti.Close();
        }
    }
}
