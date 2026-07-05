using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Library_Management_system
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "❌ Please enter Email and Password.";
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["LibraryDBConnectionString1 (Library Management system)"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string query = "SELECT * FROM Admin WHERE AdminEmail=@Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string storedHash = reader["AdminPassword"].ToString();

                            if (PasswordHelper.Verify(password, storedHash))
                            {
                                Session["AdminID"] = reader["AdminID"].ToString();
                                Session["AdminName"] = reader["AdminName"].ToString();
                                Response.Redirect("Admin dashboard.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "❌ Invalid Admin Credentials.";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "❌ Invalid Admin Credentials.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error: " + ex.Message;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }
    }
}
