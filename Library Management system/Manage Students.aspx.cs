using Library_Management_system;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Library_Management_System
{
    public partial class ManageStudents : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadStudents();
        }

        private void LoadStudents()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string query = "SELECT StudentID, StudentName, StudentEmail, RegistrationDate FROM Students";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewStudents.DataSource = dt;
                GridViewStudents.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int studentID = string.IsNullOrEmpty(hfStudentID.Value) ? 0 : Convert.ToInt32(hfStudentID.Value);
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();
                SqlCommand cmd;

                if (studentID == 0)
                {
                    // Add new student
                    cmd = new SqlCommand("INSERT INTO Students (StudentName, StudentEmail, Password) VALUES (@Name,@Email,@Password)", con);
                }
                else
                {
                    // Update existing student
                    cmd = new SqlCommand("UPDATE Students SET StudentName=@Name, StudentEmail=@Email, Password=@Password WHERE StudentID=@ID", con);
                    cmd.Parameters.AddWithValue("@ID", studentID);
                }

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.ExecuteNonQuery();
            }

            // Clear form
            txtName.Text = txtEmail.Text = txtPassword.Text = "";
            hfStudentID.Value = "";

            LoadStudents();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int studentID = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);

            using (SqlConnection con = Connection.GetConnection())
            {
                string query = "SELECT * FROM Students WHERE StudentID=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", studentID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfStudentID.Value = dr["StudentID"].ToString();
                    txtName.Text = dr["StudentName"].ToString();
                    txtEmail.Text = dr["StudentEmail"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int studentID = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);

            try
            {
                using (SqlConnection con = Connection.GetConnection())
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE StudentID=@ID", con);
                    cmd.Parameters.AddWithValue("@ID", studentID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.CssClass = "success";
                lblMessage.Text = "Student deleted successfully.";
            }
            catch (SqlException ex) when (ex.Number == 547) // FK constraint violation
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "This student cannot be deleted because they have issued-book records. Please clear their history first.";
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "❌ Error: " + ex.Message;
            }

            LoadStudents();
        }
    }
}
