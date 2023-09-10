using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            if (Request.Cookies["Uname"] != null && Request.Cookies["Pword"]!= null) {
                User_Name.Text = Request.Cookies["Uname"].Value;
                passwprd.Attributes["value"] = Request.Cookies["Pword"].Value;
                CheckBox1.Checked = true;
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void signIn(object sender, EventArgs e)
    {
          String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
          using (SqlConnection conn = new SqlConnection(cs))
          {
              SqlCommand cmd = new SqlCommand("select * from USERS where Uname= '" + User_Name.Text + "' and Pword='" + passwprd.Text + "'", conn);
              conn.Open();
              SqlDataAdapter adapter = new SqlDataAdapter(cmd);
              DataTable dt = new DataTable();
              adapter.Fill(dt);
              if (dt.Rows.Count != 0)
              {
                  if (CheckBox1.Checked)
                  {
                      Response.Cookies["Uname"].Value = User_Name.Text;
                      Response.Cookies["Pword"].Value = passwprd.Text;//login page password textField Name "passwprd"
                      Response.Cookies["Uname"].Expires = DateTime.Now.AddDays(15);
                      Response.Cookies["Pword"].Expires = DateTime.Now.AddDays(15); 
                  }
                  else {
                      Response.Cookies["Uname"].Expires = DateTime.Now.AddDays(-1);
                      Response.Cookies["Pword"].Expires = DateTime.Now.AddDays(-1); 
           
                  }
                  string userType;
                  userType = dt.Rows[0][5].ToString().Trim();
                  if (userType == "U") {
                      Session["Uname"] = User_Name.Text;
                      Response.Redirect("~/Home.aspx");
                  }
                  else if (userType == "Admin") {
                      Session["Uname"] = User_Name.Text;
                      Response.Redirect("~/DashBoard.aspx");
                  }
                 
              }
              else {
                  lblerror.Text = "Invalid UserName or Password";
                 
              }
          }
    }
}