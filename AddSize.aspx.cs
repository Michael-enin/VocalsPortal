using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadBrand();
            loadCategory();
            loadGender();
            loadSizeRepeater();
        }
    }

    private void loadSizeRepeater()
    {
        String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(str)) {
            using (SqlCommand cmd = new SqlCommand("select A.*, B.*, C.*, D.*, E.* from Size A inner join Category B on B.CategoryId = A.CategoryId inner join Brands C on C.BrandId=A.BrandId inner join SubCategory D on D.SubCategoryId=A.SubCategoryId inner join Gender E on E.GenderId=A.GenderId", conn)) {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd)) {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    sizeRepeater.DataSource = dt;
                    sizeRepeater.DataBind();
                }
            }
        }
    }

    private void loadGender()
    {
      String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
      using (SqlConnection conn = new SqlConnection(cs))
      {
          SqlCommand cmd = new SqlCommand("select * from Gender", conn);
          conn.Open();
          SqlDataAdapter adapter = new SqlDataAdapter(cmd);
          DataTable dt = new DataTable();
          adapter.Fill(dt);
          if (dt.Rows.Count != 0)
          {
              ddlGenderName.DataSource = dt;
              ddlGenderName.DataTextField = "GenderName";
              ddlGenderName.DataValueField = "GenderId";
              ddlGenderName.DataBind();
              ddlGenderName.Items.Insert(0, new ListItem("Select", "0"));
          }
      }
    }

    private void loadCategory()
    {
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select * from Category ", conn);
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

    private void loadBrand()
       
    {
        
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select * from Brands ", conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;

                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandId";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("Select", "0"));

            }


        }   
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("insert into Size(SizeName, BrandId, CategoryId, SubCategoryId, GenderID) values('" + tboxSizeName.Text + "', '" + ddlBrand.SelectedItem.Value + "', '" + ddlCategory.SelectedItem.Value + "', '" + ddlSubCategory.SelectedItem.Value + "', '" + ddlGenderName.SelectedItem.Value + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            tboxSizeName.Text = string.Empty;
            ddlBrand.ClearSelection();
            ddlBrand.Items.FindByValue("0").Selected=true;
            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;
            ddlSubCategory.ClearSelection();
            ddlSubCategory.Items.FindByValue("0").Selected=true;
            ddlGenderName.ClearSelection();
            ddlGenderName.Items.FindByValue("0").Selected = true;
        }
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select * from SubCategory where MainCatId='"+ddlCategory.SelectedItem.Value+"'", conn);
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
            }
        }   
    }
}