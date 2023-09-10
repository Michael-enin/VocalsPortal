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
using System.Net.Mail;
using System.Net;
public partial class ForgotPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {

    }
    protected void btnPassReset_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs)) {
            SqlCommand cmd = new SqlCommand("select *from USERS where Email='"+emailTextBox.Text+"'", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count!= 0)
            {
                String myGuid = Guid.NewGuid().ToString();
                int uId = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmdLocal = new SqlCommand("insert into ForgotPasswordRequests values ('" + myGuid + "', '" + uId + "', getdate())", conn);
                cmdLocal.ExecuteNonQuery();
                //send to email
                // email is fifth column in "ForgotPasswordRequests" table
                //then its index is at '4'
                string toEmail = dt.Rows[0][4].ToString();
                string userName = dt.Rows[0][1].ToString();
                //email message to be sent
                string emailBody = "Hey, " + userName + ", <br/><br/> Click the link below to reset your password <br/> http://localhost:51452/RecoverPassword.aspx?Uid="+myGuid;
                MailMessage passReceiveMail = new MailMessage("se.michael.gobana@gmail.com", toEmail);
                passReceiveMail.Body = emailBody;
                passReceiveMail.Subject = "Reset password";
                passReceiveMail.IsBodyHtml = true;
                  //end of message sent
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "se.michael.gobana@gmail.com",
                    Password = "shitaye2611"
                };
               
                smtp.EnableSsl = true;
                smtp.Send(passReceiveMail);

                lblPassCheck.Text = "Check Your EMail to reset your email!";
                lblPassCheck.ForeColor = Color.Green;
                 
            }
            else {
                lblPassCheck.Text = "Sorry, this email is not available";
                lblPassCheck.ForeColor = Color.Red;
            }                    
        }
    }
}
