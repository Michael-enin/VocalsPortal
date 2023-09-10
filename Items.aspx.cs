using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadItemsRepeater();
        }
    }
    private void loadItemsRepeater()
    {
        String str = ConfigurationManager.ConnectionStrings["TestingDBConnectionString1"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand("procSelectAllItems", conn))     
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    itemsRepeater.DataSource = dt;
                    itemsRepeater.DataBind();
                }

            }
        }
    }
}