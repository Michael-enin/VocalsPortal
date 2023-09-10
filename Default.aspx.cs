using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadCartNumbers();
        if (Session["Uname"] != null)
        {
            btnSignUp.Visible = true;
            btnSignIn.Visible = false;
            btnSignOut.Visible = true;
        }
        else
        { 
            btnSignUp.Visible = false;
            btnSignIn.Visible = true;
            btnSignOut.Visible = false;
        }
    }
    protected void loadCartNumbers()
    {

        if (Request.Cookies["cartItemId"] != null)
        {

            string cookieItemId = Request.Cookies["cartItemId"].Value.Split('=')[1];
            string[] itemsArray = cookieItemId.Split(',');
            int itemsCount = itemsArray.Length;
            itemsCounter.InnerText = itemsCount.ToString();
        }
        else {
            itemsCounter.InnerText = 0.ToString();
        }

    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["Uname"] = null;
        Response.Redirect("~/Default.aspx");
    }
}