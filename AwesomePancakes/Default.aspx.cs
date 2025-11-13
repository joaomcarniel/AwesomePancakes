using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwesomePancakes
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<object> GetMenuItems(string category)
        {
            List<object> items = new List<object>();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;
            string query = "SELECT PancakeName, PancakeDescription, PancakePrice FROM Pancakes WHERE PancakeCategory = @Category";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    items.Add(new
                    {
                        name = reader["PancakeName"].ToString(),
                        desc = reader["PancakeDescription"].ToString(),
                        price =$"€{reader["PancakePrice"]}"
                    });
                }
            }

            return items;
        }
    }
}