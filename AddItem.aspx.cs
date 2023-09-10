using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddItem : System.Web.UI.Page
{
  public static  String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadBrands();
            loadCategory();
            loadGender();
            ddlSubCategory.Enabled = false;
            ddlGender.Enabled = false;
          //  loadSubCategory();
        }
    }

    private void loadGender()
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Gender", conn))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "GenderName";
                    ddlGender.DataValueField = "GenderId";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("Select", "0"));
                }

            }
        }
    }

    private void loadCategory()
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            SqlCommand cmd = new SqlCommand("select * from Category", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("Select", "0"));
                

            }
        }
    }

    private void loadBrands()
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            SqlCommand cmd = new SqlCommand("select * from Brands", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlistBrand.DataSource = dt;
                ddlistBrand.DataTextField = "Name";
                ddlistBrand.DataValueField = "BrandId";
                ddlistBrand.DataBind();
                ddlistBrand.Items.Insert(0, new ListItem("Select", "0"));

            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(str)){
            SqlCommand cmd = new SqlCommand("procItemsInserting", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ItemName", tboxItemName.Text);
            cmd.Parameters.AddWithValue("@ItemPrice", tboxPrice.Text);
            cmd.Parameters.AddWithValue("@ItemSellPrice", tboxlSellingPrice.Text);
            cmd.Parameters.AddWithValue("@BrandId", ddlistBrand.Text);
            cmd.Parameters.AddWithValue("@CategoryId", ddlCategory.Text);
            cmd.Parameters.AddWithValue("@SubCategoryId", ddlSubCategory.Text);
            cmd.Parameters.AddWithValue("@GenderID", ddlGender.Text);
            cmd.Parameters.AddWithValue("@ItemDescription", tboxDescription.Text);
            cmd.Parameters.AddWithValue("@ItemDetails", lboxItemDetail.Text);

            
            if (checkBFreeDelivery.Checked == true)
            {
                cmd.Parameters.AddWithValue("@freedelivery", 1.ToString());

            }
            else {
                cmd.Parameters.AddWithValue("@freedelivery", 0.ToString());
            }
            if (checkB30DaysRet.Checked == true)
            {
                cmd.Parameters.AddWithValue("@30daysreturn", 1.ToString());
            }
            else {
                cmd.Parameters.AddWithValue("@30daysreturn", 0.ToString());
            }
            conn.Open();
            Int64 Item_ID = Convert.ToInt64(cmd.ExecuteScalar());
            //now insert this Item_ID into ItemsSizeQuantity Table;
            for (int i = 0; i < chklistSize.Items.Count; i++) {
                if (chklistSize.Items[i].Selected == true) {
                    Int64 SizeId = Convert.ToInt64(chklistSize.Items[i].Value);
                    int quantity = Convert.ToInt32(tBoxQuantity.Text);
                    //now insert Item_ID, SizeId and quantity into "ItemsSizeQuantity" table
                    SqlCommand cd = new SqlCommand("insert into ItemsSizeQuantity values('" + Item_ID + "', '" + SizeId + "', '" + quantity + "')", conn);
                    cd.ExecuteNonQuery();
                    
                }
            }
            //insert images and upload into directory
                 //image1
            if (fileUpload01.HasFile) {
                string saveFilePath = Server.MapPath("~/images/ItemImages/") + Item_ID;
                if (!Directory.Exists(saveFilePath))
                {
                    Directory.CreateDirectory(saveFilePath);
                }
                    string fileExtension = Path.GetExtension(fileUpload01.PostedFile.FileName);
                    fileUpload01.SaveAs(saveFilePath + "\\"+ tboxItemName.Text.ToString().Trim() + "01" + fileExtension);
                    SqlCommand cd = new SqlCommand("insert into ItemsImages values('" + Item_ID + "', '" + tboxItemName.Text.ToString().Trim() + "01"+"', '" + fileExtension + "')", conn);
                    cd.ExecuteNonQuery();
               
           }
            //image2
            if (fileUpload02.HasFile)
            {
                string saveFilePath = Server.MapPath("~/images/ItemImages/") + Item_ID;
                if (!Directory.Exists(saveFilePath))
                {
                    Directory.CreateDirectory(saveFilePath);
                }
                    string fileExtension = Path.GetExtension(fileUpload02.PostedFile.FileName);
                    fileUpload02.SaveAs(saveFilePath + "\\" + tboxItemName.Text.ToString().Trim() + "02" + fileExtension);
                    SqlCommand cd = new SqlCommand("insert into ItemsImages values('" + Item_ID + "', '" + tboxItemName.Text.ToString().Trim() + "02" + "', '" + fileExtension + "')", conn);
                    cd.ExecuteNonQuery();
                
            }
            //image3
            if (fileUpload03.HasFile)
            {
                string saveFilePath = Server.MapPath("~/images/ItemImages/") + Item_ID;
                if (!Directory.Exists(saveFilePath))
                {
                    Directory.CreateDirectory(saveFilePath);
                }
                    string fileExtension = Path.GetExtension(fileUpload03.PostedFile.FileName);
                    fileUpload03.SaveAs(saveFilePath + "\\" + tboxItemName.Text.ToString().Trim() + "03" + fileExtension);
                    SqlCommand cd = new SqlCommand("insert into ItemsImages values('" + Item_ID + "', '" + tboxItemName.Text.ToString().Trim() + "03" + "', '" + fileExtension + "')", conn);
                    cd.ExecuteNonQuery();
                
            }
            //image4
            if (fileUpload04.HasFile)
            {
                string saveFilePath = Server.MapPath("~/images/ItemImages/") + Item_ID;
                if (!Directory.Exists(saveFilePath))
                {
                    Directory.CreateDirectory(saveFilePath);
                }
                    string fileExtension = Path.GetExtension(fileUpload04.PostedFile.FileName);
                    fileUpload04.SaveAs(saveFilePath + "\\" + tboxItemName.Text.ToString().Trim() + "04" + fileExtension);
                    SqlCommand cd = new SqlCommand("insert into ItemsImages values('" + Item_ID + "', '" + tboxItemName.Text.ToString().Trim() + "04" + "', '" + fileExtension + "')", conn);
                    cd.ExecuteNonQuery();
                
            }
        }
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(str))
        {
            SqlCommand cmd = new SqlCommand("select * from SubCategory where MainCatId='" + ddlCategory.SelectedItem.Value + "'", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCategoryName";
                ddlSubCategory.DataValueField = "SubCategoryId";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("Select", "0"));
                ddlSubCategory.Enabled = true;
            }
        }
    }

    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(str)) {
            SqlCommand cmd = new SqlCommand("select * from Size where BrandId='" + ddlistBrand.SelectedItem.Value + "' and CategoryId='" + ddlCategory.SelectedItem.Value + "'and SubCategoryId= '" + ddlSubCategory.SelectedItem.Value + "'and GenderID='" + ddlGender.SelectedValue + "'", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            if (dt.Rows.Count != 0) {
               
                chklistSize.DataSource = dt;
                chklistSize.DataTextField = "SizeName";
                chklistSize.DataValueField = "SizeId";
                chklistSize.DataBind();
                chklistSize.Visible = true;
            }
        }
    }
    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex != 0) {
            ddlGender.Enabled = true;
        }
    }
}