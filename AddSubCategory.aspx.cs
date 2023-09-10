using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadMainCategory();
            loadSubCategoryRepeater();
        }
    }

    private void loadSubCategoryRepeater()
    {
        String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(str)) {
            using (SqlCommand cmd = new SqlCommand("select A.*, B.* from SubCategory A inner join Category B on B.CategoryId=A.MainCatID", conn)) {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    subCatRepeater.DataSource = dt;
                    subCatRepeater.DataBind();
                }
            }
        }
    }

    private void loadMainCategory()
    {
           String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
           using (SqlConnection conn = new SqlConnection(cs))
           {
               SqlCommand cmd = new SqlCommand("select * from Category", conn);
               conn.Open();
               SqlDataAdapter adapter = new SqlDataAdapter(cmd);
               DataTable dt = new DataTable();
               adapter.Fill(dt);
               if (dt.Rows.Count != 0){
                   ddlCategory.DataSource = dt;
                   ddlCategory.DataTextField = "CategoryName";
                   ddlCategory.DataValueField = "CategoryId";
                   ddlCategory.DataBind();
                   ddlCategory.Items.Insert(0, new ListItem("Select", "0"));
               
               }
           }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click1(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("insert into SubCategory values('" + tboxSubCategory.Text + "', '"+ddlCategory.SelectedItem.Value+"')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            tboxSubCategory.Text = string.Empty;
            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;  
        }
        loadSubCategoryRepeater();
    }
}