using System;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class AdminChangePassword : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "All fields are required.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "New password and confirmation do not match.";
                return;
            }

            int adminId = Convert.ToInt32(Session["AdminID"]);

            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();

                // Verify current password first
                SqlCommand cmdGet = new SqlCommand("SELECT AdminPassword FROM Admin WHERE AdminID=@ID", con);
                cmdGet.Parameters.AddWithValue("@ID", adminId);
                string storedHash = cmdGet.ExecuteScalar().ToString();

                if (!PasswordHelper.Verify(currentPassword, storedHash))
                {
                    lblMessage.CssClass = "error";
                    lblMessage.Text = "Current password is incorrect.";
                    return;
                }

                // Save the new hashed password
                string newHash = PasswordHelper.Hash(newPassword);
                SqlCommand cmdUpdate = new SqlCommand("UPDATE Admin SET AdminPassword=@Password WHERE AdminID=@ID", con);
                cmdUpdate.Parameters.AddWithValue("@Password", newHash);
                cmdUpdate.Parameters.AddWithValue("@ID", adminId);
                cmdUpdate.ExecuteNonQuery();
            }

            lblMessage.CssClass = "success";
            lblMessage.Text = "Password updated successfully!";
            txtCurrentPassword.Text = txtNewPassword.Text = txtConfirmPassword.Text = "";
        }
    }
}