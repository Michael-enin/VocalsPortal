using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadCategoryRepeater();

        }
    }

    private void loadCategoryRepeater()
    {
        String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Category", conn))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    categoriesRepeater.DataSource = dt;
                    categoriesRepeater.DataBind();
                }

            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("insert into Category(CategoryName) values('" + tboxCategoryName.Text + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            tboxCategoryName.Text = string.Empty;

        }
        loadCategoryRepeater();
    }
}