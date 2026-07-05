using System;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtStudentName.Text.Trim();
            string email = txtStudentEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string hashedPassword = PasswordHelper.Hash(password);
            string gender = ddlGender.SelectedValue;
            string mobile = txtMobile.Text.Trim();
            string address = txtAddress.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "Name, Email, and Password are required!";
                return;
            }

            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();

                // Check if email exists
                SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM Students WHERE StudentEmail=@Email", con);
                cmdCheck.Parameters.AddWithValue("@Email", email);
                int exists = (int)cmdCheck.ExecuteScalar();
                if (exists > 0)
                {
                    lblMessage.CssClass = "error";
                    lblMessage.Text = "Email is already registered!";
                    return;
                }

                // Insert new student
                SqlCommand cmd = new SqlCommand(@"INSERT INTO Students 
                   (StudentName, StudentEmail, Password, Gender, Mobile, Address, RegistrationDate) 
                   VALUES (@Name,@Email,@Password,@Gender,@Mobile,@Address,GETDATE())", con);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password",hashedPassword);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Address", address);

                cmd.ExecuteNonQuery();

                lblMessage.CssClass = "success";
                lblMessage.Text = "Registration successful! You can now login.";

                // Clear fields
                txtStudentName.Text = txtStudentEmail.Text = txtPassword.Text = txtMobile.Text = txtAddress.Text = "";
                ddlGender.SelectedIndex = 0;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx"); // Main login page
        }

        protected void txtStudentName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtStudentEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}


