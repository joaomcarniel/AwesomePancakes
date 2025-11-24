using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

namespace AwesomePancakes
{
    public partial class Booking : System.Web.UI.Page
    {
        private static readonly int TotalCapacityOfPeople = 24;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<string> GetBusySchedules(string date, int numPeople)
        {
            List<string> busySchedules = new List<string>();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                //string query = "SELECT TimeBooking FROM Booking WHERE CONVERT(date, DateBooking) = @DateBooking";
                string query = "SELECT TimeBooking, SUM(NumberPeople) People FROM Booking WHERE DateBooking = @DateBooking GROUP BY TimeBooking;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DateBooking", DateTime.Parse(date).Date);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if((TotalCapacityOfPeople - int.Parse(reader["People"].ToString())) < numPeople)
                        busySchedules.Add(reader["TimeBooking"].ToString());
                }
            }

            return busySchedules;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                string date = txtDate.Text;
                string time = Request.Form["ddlSchedule"];
                string telephone = txtTelephone.Text;
                int numOfPeople = int.Parse(ddlNumPeople.Text);
                string message = txtMessage.Text;
                int idBooking = 0;
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                            INSERT INTO Booking 
                                (NameBooking, EmailBooking, DateBooking, TimeBooking, MessageBooking, ContactDate, telephone, NumberPeople)
                            VALUES 
                                (@name, @email, @date, @time, @message, GETDATE(), @telephone, @numOfPeople);
                            SELECT CAST(SCOPE_IDENTITY() AS INT);";


                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@time", time);
                    cmd.Parameters.AddWithValue("@message", message);
                    cmd.Parameters.AddWithValue("@telephone", telephone);
                    cmd.Parameters.AddWithValue("@numOfPeople", numOfPeople);

                    conn.Open();
                    idBooking = (int)cmd.ExecuteScalar();
                }


                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"SELECT ISNULL(MAX(TableNumber) + 1, 1) AS NextAvailable  FROM BookingTables WHERE DateBooking = @date AND  TimeBooking = @time;";
                    int nextAvailable = 0;

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@time", time);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                             nextAvailable = int.Parse(reader["NextAvailable"].ToString());
                    }
                    query = "Select TableNumber, Capacity FROM RestaurantTables;";
                    cmd = new SqlCommand(query, conn);
                    reader.Close();
                    reader = cmd.ExecuteReader();
                    Dictionary<int, int> tables = new Dictionary<int, int>();
                    while (reader.Read())
                    {
                        tables.Add(int.Parse(reader["TableNumber"].ToString()), int.Parse(reader["Capacity"].ToString()));
                    }

                    while (true)
                    {
                        query = @"INSERT INTO BookingTables (IdBooking, TableNumber, TimeBooking, DateBooking) VALUES (@IdBooking, @TableNumber, @TimeBooking, @DateBooking)";
                        cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@IdBooking", idBooking);
                        cmd.Parameters.AddWithValue("@TableNumber", nextAvailable);
                        cmd.Parameters.AddWithValue("@TimeBooking", time);
                        cmd.Parameters.AddWithValue("@DateBooking", date);
                        reader.Close();
                        reader = cmd.ExecuteReader();
                        if (numOfPeople <= tables[nextAvailable])
                        {
                            break;
                        }
                        numOfPeople = numOfPeople - tables[nextAvailable];
                        nextAvailable++;
                    }
                }



                lblStatus.Text = "Reservation completed successfully!";
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtDate.Text = string.Empty;
                txtMessage.Text = string.Empty;
                txtTelephone.Text = string.Empty;
            }
            catch(Exception message)
            {
                if(string.IsNullOrEmpty(txtName.Text))
                {
                    lblNameError.Text = "Name is required.";
                }
                if (string.IsNullOrEmpty(txtEmail.Text))
                {
                    lblEmailError.Text = "Email is required.";
                }
                if (string.IsNullOrEmpty(txtDate.Text))
                {
                    lblDateError.Text = "Date is required.";
                }
                if (string.IsNullOrEmpty(Request.Form["ddlSchedule"]))
                {
                    lblScheduleError.Text = "Time is required.";
                }
            }
            
        }


    }
}
