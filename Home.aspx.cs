using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadCartNumbers();
        if (Session["Uname"] != null)
        {
            btnSignIn.Visible = false;
            btnSignOut.Visible = true;
            lblsuccess.Text = "Login Success!, Welcome "+Session["Uname"].ToString()+" , User";
        }
        else {
            btnSignIn.Visible = true;
            btnSignOut.Visible = false;
        }
    }

    private void loadCartNumbers()
    {
        if (Request.Cookies["cartItemId"] != null)
        {

            string cookieItemId = Request.Cookies["cartItemId"].Value.Split('=')[1];
            string[] itemsArray = cookieItemId.Split(',');
            int itemsCount = itemsArray.Length;
            itemsCounterId.InnerText = itemsCount.ToString();
        }
        else
        {
            itemsCounterId.InnerText = 0.ToString();
        }
    }

    protected void btnSign_Out_Click(object sender, EventArgs e)
    {
        Session["Uname"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
}