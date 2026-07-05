using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Library_Management_system
{
    public partial class StudentLogin : System.Web.UI.Page
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
                    string query = "SELECT * FROM Students WHERE StudentEmail=@Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string storedHash = reader["Password"].ToString();

                            if (PasswordHelper.Verify(password, storedHash))
                            {
                                Session["StudentID"] = reader["StudentID"].ToString();
                                Session["StudentName"] = reader["StudentName"].ToString();
                                Response.Redirect("Student dashboard.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "❌ Invalid Email or Password.";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "❌ Invalid Email or Password.";
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

