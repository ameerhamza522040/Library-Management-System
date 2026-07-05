using System;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class RequestBook : StudentPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO BookRequests (StudentName, StudentEmail, BookTitle, RequestDate, Status) VALUES (@Name, @Email, @BookTitle, GETDATE(), 'Pending')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@BookTitle", txtBookTitle.Text.Trim());
                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "✅ Book request submitted successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Clear fields
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtBookTitle.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "❌ Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
