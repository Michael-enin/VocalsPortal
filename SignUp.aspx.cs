using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btSignUp_Click(object sender, EventArgs e)
    {
        if (tbUname.Text!= "" && tbPass.Text != "" && tbCpass.Text != "" && tbName.Text != "" && tbEmail.Text != "")
        {
            if (tbPass.Text == tbCpass.Text)
            {
                String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("insert into USERS values('" + tbUname.Text + "', '" + tbPass.Text + "', '" + tbName.Text + "', '" + tbEmail.Text + "', 'U')", conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblmsg.Text = "Registred SuccessFully!";
                    lblmsg.ForeColor = Color.Green;
                    Response.Redirect("~/SignIn.aspx");
                }
            }
            else {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "Passwords do not matche!";
            } 
        }
        else {
            lblmsg.ForeColor = Color.Red;
            lblmsg.Text = "All Field need to be filled";
        }
    }
}