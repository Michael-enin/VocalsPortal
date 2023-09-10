using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ItemsDisplay : System.Web.UI.Page
{
    public DateTime DataTime { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ItemId"] != null)
        {
            if (!IsPostBack)
            {
                loadImagesRepeater();
                loadItemsDetails();
            }
        }
        else {
            Response.Redirect("~/Items.aspx");
        }
    }

    private void loadItemsDetails()
    {
        Int64 Item_Id = Convert.ToInt64(Request.QueryString["ItemId"]);


        String connString = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString)) {
            using (SqlCommand cmd = new SqlCommand("select * from Items where ItemId='"+ Item_Id + "'", conn)) {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd)) {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    itemsDetialsRepeater.DataSource = dt;
                    itemsDetialsRepeater.DataBind();
                }            
            }
        }
    }

    private void loadImagesRepeater()
    {
        Int64 Item_Id = Convert.ToInt64(Request.QueryString["ItemId"]);
        String connString = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from ItemsImages where ItemId='" + Item_Id + "'", conn))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    imagesDisplayRepeater.DataSource = dt;
                    imagesDisplayRepeater.DataBind();
                }

            }
        }
    }
    protected string getActiveItemsOnly(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }
    protected void addCartBtn_Click(object sender, EventArgs e)
    {
        string selectedSize = string.Empty;
        foreach (RepeaterItem item in itemsDetialsRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var radioBrnList = item.FindControl("radioBtnSizes") as RadioButtonList;
                selectedSize = radioBrnList.SelectedValue;
                var errorLabel = item.FindControl("errorLabel") as Label;
                errorLabel.Text = "";
            }
        }
        if (selectedSize != "")
        {
            Int64 Item_Id = Convert.ToInt64(Request.QueryString["ItemId"]);
            if (Request.Cookies["cartItemId"] != null)
            { 
                string cookieItemId = Request.Cookies["cartItemId"].Value.Split('=')[1];
                cookieItemId = cookieItemId + "," + Item_Id + "-" + selectedSize;
                HttpCookie cartItems = new HttpCookie("cartItemId");
                cartItems.Values["cartItemId"] = cookieItemId;
                cartItems.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cartItems);
                   //to delete cookie
                // Response.Cookies["cartItemId"].Expires = DateTime.Now.AddDays(-1);
            }
            else
            {
                HttpCookie cartItems = new HttpCookie("cartItemId");
                cartItems.Values["cartItemId"] = Item_Id.ToString() + "-" + selectedSize;
                cartItems.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cartItems);
            }
            Response.Redirect("~/ItemsDisplay.aspx?ItemId=" + Item_Id);
        }
        else {
            foreach (RepeaterItem item in itemsDetialsRepeater.Items) {
                if(item.ItemType == ListItemType.Item ||item.ItemType == ListItemType.AlternatingItem)
                {
                    var errorLabel = item.FindControl("errorLabel") as Label;
                    errorLabel.Visible = true;
                    errorLabel.Text = "Please Select One Size";
                }
            }
        }
    }
    protected void itemsDetialsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string brndId = (e.Item.FindControl("hiddenFieldBrandId") as HiddenField).Value;
            string catId = (e.Item.FindControl("hiddenFieldCategoryId") as HiddenField).Value;
            string subCatId = (e.Item.FindControl("hiddenFieldSubCategoryId") as HiddenField).Value;
            string genderId = (e.Item.FindControl("hiddenFieldGenderId") as HiddenField).Value;
            RadioButtonList rbSizelst = e.Item.FindControl("radioBtnSizes") as RadioButtonList;

            String connStr = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Size where BrandId=" + brndId + " and CategoryId=" + catId + "and SubCategoryId=" + subCatId + "and GenderID=" + genderId + "", conn))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        rbSizelst.DataSource = dt;
                        rbSizelst.DataTextField = "SizeName";
                        rbSizelst.DataValueField = "SizeId";
                        rbSizelst.DataBind();
                    }
                }
            }
        }
    }
}