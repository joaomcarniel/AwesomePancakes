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
    public partial class FAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<object> GetFaqItems()
        {
            List<object> items = new List<object>();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;
            string query = "Select FaqQuestion, FaqAnswer FROM Faq";

            using(SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    items.Add(new
                    {
                        question = reader["FaqQuestion"].ToString(),
                        answer = reader["FaqAnswer"].ToString()
                    });
                }
                conn.Close();                
            }
            return items;
        }
    }
}