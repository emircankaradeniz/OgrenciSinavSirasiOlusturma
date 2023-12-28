using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace YazilimMuhOdev_2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=OgrenciYerlestir;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT OgrenciAdi FROM tbl_Sinav ss inner join tbl_SinavDers sd on ss.SinavID=sd.SinavID inner join tbl_OgrenciDers od on od.DersID=sd.DersID inner join tbl_Ogr ogr on ogr.OgrenciID=od.OgrenciID", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dataGridView1.DataSource = ds.Tables[0];
                    //dataGridView1.DataBind();
                }
            }
        }
        public void GridiDoldur()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=OgrenciYerlestir;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT OgrenciAdi FROM tbl_Sinav ss inner join tbl_SinavDers sd on ss.SinavID=sd.SinavID inner join tbl_OgrenciDers od on od.DersID=sd.DersID inner join tbl_Ogr ogr on ogr.OgrenciID=od.OgrenciID";
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            ArrayList Isimler = new ArrayList();

            while (dr.Read())
            {
                Isimler.Add(dr["Adi"]);
            }

            dr.Close();
            con.Close();
        }
        
    }
}
