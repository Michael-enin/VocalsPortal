using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
public partial class Client : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadCartNumbers();
        if (Session["Uname"] != null)
        {
            btnSignOut.Visible = true;
            btnSignIn.Visible = false;
        }
        else
        {
            btnSignOut.Visible = false;
            btnSignIn.Visible = true;
        }
    }   
         protected void loadCartNumbers()
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

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["Uname"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
}
