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
    public partial class Cins : Form
    {
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=Veteriner; user ID=postgres; password=yusuf4415367");
        public Cins()
        {
            InitializeComponent();
            string sorgu1 = " select * from  public.\"HayvanCinsi\"";
            NpgsqlDataAdapter da1 = new NpgsqlDataAdapter(sorgu1, baglanti);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            dataGridView1.DataSource = ds1.Tables[0];
            baglanti.Close();
            
        }

        private void formCins_Load(object sender, EventArgs e)
        {

        }
    }
}
