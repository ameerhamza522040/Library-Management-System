using Library_Management_system;
using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Library_Management_System
{
    public partial class AdminDashboard : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
            }
        }

        private void LoadStats()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();

                SqlCommand cmdBooks = new SqlCommand("SELECT COUNT(*) FROM ABooks", con);
                lblTotalBooks.Text = cmdBooks.ExecuteScalar().ToString();

                SqlCommand cmdStudents = new SqlCommand("SELECT COUNT(*) FROM Students", con);
                lblTotalStudents.Text = cmdStudents.ExecuteScalar().ToString();

                SqlCommand cmdIssued = new SqlCommand("SELECT COUNT(*) FROM IssuedBooks WHERE Status='Issued'", con);
                lblBooksIssued.Text = cmdIssued.ExecuteScalar().ToString();

                SqlCommand cmdRequests = new SqlCommand("SELECT COUNT(*) FROM BookRequests WHERE Status='Pending'", con);
                lblPendingRequests.Text = cmdRequests.ExecuteScalar().ToString();

                SqlCommand cmdOverdue = new SqlCommand("SELECT COUNT(*) FROM IssuedBooks WHERE Status='Issued' AND DueDate < GETDATE()", con);
                lblOverdue.Text = cmdOverdue.ExecuteScalar().ToString();
            }
        }

        protected void btnManageStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage Students.aspx");
        }

        protected void btnManageBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageBooks.aspx");
        }

        protected void btnIssuedBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssuedBooks.aspx");
        }

        protected void btnManageRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRequests.aspx");
        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminChangePassword.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Admin"] = null;
            Response.Redirect("Main.aspx");
        }
    }
}