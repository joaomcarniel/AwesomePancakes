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
    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<object> GetStaff()
        {
            List<object> members = new List<object>();

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;
            string query = "SELECT StaffName, StaffRole, StaffDescription, StaffImageUrl FROM Staff";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    members.Add(new
                    {
                        name = reader["StaffName"].ToString(),
                        role = reader["StaffRole"].ToString(),
                        description = reader["StaffDescription"].ToString(),
                        image = reader["StaffImageUrl"].ToString()
                    });
                }
            }

            return members;
        }
    }
}