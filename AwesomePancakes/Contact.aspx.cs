using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

namespace AwesomePancakes
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<string> GetBusySchedules(string date)
        {
            List<string> busySchedules = new List<string>();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TimeBooking FROM Booking WHERE CONVERT(date, DateBooking) = @DateBooking";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DateBooking", DateTime.Parse(date).Date);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    busySchedules.Add(reader["TimeBooking"].ToString());
                }
            }

            return busySchedules;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string date = txtDate.Text;
            string time = Request.Form["ddlSchedule"];
            string message = txtMessage.Text;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"INSERT INTO Booking 
                                (NameBooking, EmailBooking, DateBooking, TimeBooking, MessageBooking, ContactDate)
                                VALUES (@name, @email, @date, @time, @message, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@time", time);
                cmd.Parameters.AddWithValue("@message", message);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblStatus.Text = "Booking Sent!";
        }
    }
}
