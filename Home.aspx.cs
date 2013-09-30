using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;

namespace WebApplication2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select question_id,questionTitle from questions", con); 
             DataSet ds = new DataSet(); 
             da.Fill(ds, "questions");
            //creating right hand tags
             SqlDataAdapter daTgsR = new SqlDataAdapter("select tagName from tags", con);
             DataSet dsTagsR = new DataSet();
             daTgsR.Fill(dsTagsR, "tags");
             foreach (DataRow row3 in dsTagsR.Tables["tags"].Rows)
             {
                 HtmlGenericControl lbltgs = new HtmlGenericControl("Lable");
                 lbltgs.Attributes.Add("class", "tagLbl");
                 lbltgs.InnerText = row3["tagName"].ToString();
                 HtmlGenericControl divTagsR = new HtmlGenericControl("Div");
                 divTagsR.Attributes.Add("class", "divTagsR");
                 divTagsR.Controls.Add(lbltgs);
                 divTgs.Controls.Add(divTagsR);
             }
             TableRow trow1 = new TableHeaderRow();
             Table table = new Table();
             table.Attributes.Add("id", "qtable");
            
             trow1.TableSection = TableRowSection.TableHeader;
             var cell1 = new TableCell();
             cell1.Text = "answears";
             var cell2 = new TableCell();
             cell2.Text = "views";
             var cell3 = new TableCell();
             cell3.Text = "Question";
             
             trow1.Attributes.Add("class", "theader");
             trow1.Cells.Add(cell1);
             trow1.Cells.Add(cell2);
             trow1.Cells.Add(cell3);
             table.Rows.Add(trow1);
             
            foreach(DataRow row in ds.Tables["questions"].Rows)
             {
              
            TableRow trow2 = new TableRow();
             var cell4 = new TableCell();
             cell4.Text = "0";
             var cell5 = new TableCell();
             cell5.Text = "0";
             var cell6 = new TableCell();
             //cell6.Text = row["questionTitle"].ToString();
                //adding css class to the cells
             trow2.Attributes.Add("class", "tableData");
             cell6.Attributes.Add("class", "tableQuestions");

             HtmlGenericControl divW = new HtmlGenericControl("DIV");
             divW.Attributes.Add("class", "divW");
             HtmlGenericControl divQ = new HtmlGenericControl("DIV");
             divW.Attributes.Add("class", "divQ");
             HtmlGenericControl divT = new HtmlGenericControl("DIV");
             divW.Attributes.Add("class", "divT");
                //fetching the tags
             string str = "select top(3) tagName from questiontags qt,tags t where qt.tag_id=t.tag_id and qt.question_id=" + Convert.ToInt32(row["question_id"]);
             SqlDataAdapter getTags = new SqlDataAdapter(str, con);  
             DataSet ds1 = new DataSet();
             getTags.Fill(ds1, "tags");
                
             foreach (DataRow row1 in ds1.Tables["tags"].Rows)
             {
                 HtmlGenericControl lbl = new HtmlGenericControl("Lable");
                 lbl.Attributes.Add("class", "tagLbl");
                 lbl.InnerText = row1["tagName"].ToString();
                 divT.Controls.Add(lbl);
             }
                //creating anchor   
             
             HyperLink anchor = new HyperLink();
             anchor.Text= row["questionTitle"].ToString();
             anchor.NavigateUrl = "Question.aspx?question_id=" + row["question_id"].ToString() ;
             anchor.ToolTip= "a question";
             divQ.Controls.Add(anchor);
             
             divW.Controls.Add(divQ);
             divW.Controls.Add(divT);
             cell6.Controls.Add(divW);
            // cell6.Controls.Add(anchor);
             trow2.Cells.Add(cell4);
             trow2.Cells.Add(cell5);
             trow2.Cells.Add(cell6);
             //adding the row to the table 
             table.Rows.Add(trow2);                  
             }
            
            this.Controls.Add(table);
            con.Close();
        }

        protected void login_Click(object sender, EventArgs e)
        {
           
        
            SqlConnection con = new SqlConnection("server=(localdb)\\v11.0;Initial Catalog=WebApplication2;Integrated Security=true");
            con.Open();
            string str = "select count(*) from Users where userName='" + username.Text + "'";
            SqlCommand command = new SqlCommand(str, con);
            int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
            if (temp == 1)
            {
                string str2 = "select password from Users where userName='" + username.Text + "'";

                SqlCommand command2 = new SqlCommand(str2, con);
                string tempPass = command2.ExecuteScalar().ToString().ToLower().Trim();
                
                
                
                if (tempPass==pass.Text.ToLower().Trim())
                {
                    string str3 = "select user_id from Users where userName='" + username.Text + "'";
                    SqlCommand command3 = new SqlCommand(str3, con);
                    temp = Convert.ToInt32(command.ExecuteScalar().ToString());
                    con.Close();
                    Session["new"] = temp;                  
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Wrong password!";
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Invalid user name!";
            }                      
        }

        public Control h1 { get; set; }
    }
}
         