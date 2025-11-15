using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace AwesomePancakes
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mensagem = txtMensagem.Text.Trim();

            if (string.IsNullOrEmpty(nome) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(mensagem))
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Todos os campos são obrigatórios!";
                return;
            }

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PancakeDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Bookings (NameBooking, EmailBooking, BookingMessage, BookingDate) VALUES (@Name, @Email, @Message, @DataEnvio)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", nome);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", mensagem);
                    cmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        lblStatus.Text = "Mensagem enviada com sucesso!";

                        txtNome.Text = txtEmail.Text = txtMensagem.Text = "";
                    }
                    catch (Exception ex)
                    {
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        lblStatus.Text = "Erro ao enviar mensagem: " + ex.Message;
                    }
                }
            }
        }
    }
}
