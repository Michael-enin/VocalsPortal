using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
public partial class RecoverPassword : System.Web.UI.Page
{
    String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ToString();
    String guidValue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(str)){
         guidValue = Request.QueryString["Uid"];
            if(guidValue!=null){
                SqlCommand cmd = new SqlCommand("select * from ForgotPasswordRequests where id ='"+guidValue+"'", conn);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count != null)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else { 
                  //todo 
                }
            }
            else {
                Response.Redirect("~/Default.aspx");
            }
        };
        if (IsPostBack) {
            if (dt.Rows.Count != 0)
            {
                newPassTextBox.Visible = true;
                confirmPassworTextBox.Visible = true;
                lblpassWord.Visible = true;
                lblConfirmPassWord.Visible = true;
                btnResetYourPassword.Visible = true;
            }
            else {
                lblMessage.Text = "Your Password Reset link is expired or invalid!";
                lblMessage.ForeColor = Color.Red;
  
            }
        }
    }
    protected void btnResetYourPassword_Click(object sender, EventArgs e)
    {
        if (newPassTextBox.Text != "" && confirmPassworTextBox.Text != "" && newPassTextBox.Text == confirmPassworTextBox.Text)
        {
            using (SqlConnection conn = new SqlConnection(str))
            {
                SqlCommand cmd = new SqlCommand("update USERS set Pword='" + newPassTextBox.Text + "' where Uid='" + Uid + "'", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}