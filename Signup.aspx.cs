using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication2
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
                con.Open();
                string str = "select count(*) from Users where userName='" + txtbuserName.Text + "'";
                SqlCommand command = new SqlCommand(str, con);
                int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
                con.Close();
                if (temp == 1)
                {
                    Response.Write("This user name already exists!");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
            con.Open();
            string insCmd = "insert into Users(userName,password,email) values(@userName,@password,@email)";
            SqlCommand insertUser=new SqlCommand(insCmd,con);
            insertUser.Parameters.AddWithValue("@userName", txtbuserName.Text);
            insertUser.Parameters.AddWithValue("@password",txtbPass.Text);
            insertUser.Parameters.AddWithValue("@email", txtbemail.Text);

            try
            {
                insertUser.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Home.aspx");
            }
            catch (Exception er) {
                Response.Write("<br>Unsuccessful to connect to the database!</br>");
            }
        }
    }
}