using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          /*  SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
            SqlCommand command = new SqlCommand("select * from Test;", con);
            con.Open();
            SqlDataReader rdr = command.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            con.Close();*/
        }
    }
}