using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public partial class Question : System.Web.UI.Page

    {
       protected string qid;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["new"] == null)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "Login", "<script type='text/javascript'>var r=confirm('Press a button!');if(r==true){window.location = 'Home.aspx';};</script>");


            }
            else
            {
                SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select question_id,questionTitle,questionDescription from questions where question_id=" + Convert.ToInt32(Request.QueryString["question_id"]), con);
                DataSet ds = new DataSet();
                da.Fill(ds, "questions");

                foreach (DataRow row in ds.Tables["questions"].Rows)
                {
                    qid = row["question_id"].ToString();
                    qTitleH.InnerHtml = row["questionTitle"].ToString();
                    description.InnerText = row["questionDescription"].ToString();
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
            con.Open();
            SqlCommand command = new SqlCommand("INSERT INTO answears (question_id,answear)  VALUES (@question_id,@answear)", con);
            command.Parameters.AddWithValue("@question_id",qid);
            command.Parameters.AddWithValue("@answear", answearArea.InnerText.ToString());
            command.ExecuteNonQuery();
            con.Close();
        }
        
      protected void Button2_Click(object sender, EventArgs e)
        {
            Session["new"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}