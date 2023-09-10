using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadCartItems();
        }
    }
    private void loadCartItems()
    {
        if (Request.Cookies["CartItemId"] != null)
        {
            string cookieItemId = Request.Cookies["CartItemId"].Value.Split('=')[1];
            string[] cookieInfoArray = cookieItemId.Split(',');
            if (cookieInfoArray.Length > 0)
            {
                //"id=numberOfItemsOnCart"
                // number of items counter which can be added to cookie

                numberOfItemsOnCart.InnerText = "My Cart (" + cookieInfoArray.Length + " Items) ";

                DataTable dt = new DataTable();
                double totaloriginalPrice = 0;
                double totallUpdatedSellingPrice = 0;
                double diff = 0;
                double discount = 0;
                //cookie data found
                //do something 
                for (int i = 0; i < cookieInfoArray.Length; i++)
                {
                    string itemId = cookieInfoArray[i].ToString().Split('-')[0];
                    string sizeId = cookieInfoArray[i].ToString().Split('-')[1];
                    String connString = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        using (SqlCommand cmd = new SqlCommand(" select A.*, dbo.getSizeName(" + sizeId + ") as mySizeName, " + sizeId + " as mySizeID, SizeData.Name, SizeData.Extension  from Items A cross apply(select top 1  B.Name, Extension from ItemsImages B where B.ItemId = A.ItemId) SizeData where A.ItemId = " + itemId + "", conn))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                            {
                                adapter.Fill(dt);
                            }
                        }
                    }
                    totaloriginalPrice += Convert.ToDouble(dt.Rows[i]["ItemPrice"]);
                    totallUpdatedSellingPrice += Convert.ToDouble(dt.Rows[i]["ItemSellPrice"]);
                   
                }
                cartItemsRepeater.DataSource = dt;
                cartItemsRepeater.DataBind();
                id_PriceDetails.Visible = false;
                id_cartTotal.InnerText = totaloriginalPrice.ToString() + " Birr";
                id_totalAmount.InnerText = totallUpdatedSellingPrice.ToString() + " Birr";
                diff = totaloriginalPrice - totallUpdatedSellingPrice;
                discount = (diff / totaloriginalPrice) * 100;
                id_discountOnCart.InnerText = ((long)discount).ToString() + "% Birr";
                long y = (long)(diff / totaloriginalPrice * 100);

            }
            else
            {
                // Todo cookie is empty
                numberOfItemsOnCart.InnerText = "Your Current Cart Empty, please Start Shopping!";
                id_PriceDetails.Visible = false;
            }
        }
        else {
            //Todo cookie is empty
            numberOfItemsOnCart.InnerText = "Your Current Cart Empty, please Start Shopping!";
            id_PriceDetails.Visible = false;
        }
    }
    protected void removeCartBtn_Click1(object sender, EventArgs e)
    {
        string cookie = Request.Cookies["cartItemId"].Value.Split('=')[1];
        Button btn = (Button)(sender);
        string sizeId = btn.CommandArgument;
        List<string> cookieItemIdList = cookie.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        cookieItemIdList.Remove(sizeId);
        string cookieChanged = String.Join(",", cookieItemIdList.ToArray());
        if (cookieChanged == "")
        {
            HttpCookie mycookie = Request.Cookies["cartItemId"];
            mycookie.Values["cartItemId"] = null;
            mycookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(mycookie);
        }
        else {
            HttpCookie mycookie = Request.Cookies["cartItemId"];
            mycookie.Values["cartItemId"] = cookieChanged;
            mycookie.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(mycookie);
        }
        //After Removing cookie we need to refresh Page
        Response.Redirect("~/Cart.aspx");//easy way to refresh page
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        if (Session["Uname"] != null)
        {
            Response.Redirect("~/Payment.aspx");
        }
        else {
            Response.Redirect("~/SignIn.aspx?rurl=cart");
        }
    }
}