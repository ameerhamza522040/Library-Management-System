using System;
using System.Data;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class ManageRequests : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string query = "SELECT RequestID, StudentName, StudentEmail, BookTitle, RequestDate, Status FROM BookRequests ORDER BY RequestDate DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRequests.DataSource = dt;
                GridViewRequests.DataBind();
            }
        }

        private void UpdateStatus(int requestId, string newStatus)
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE BookRequests SET Status=@Status WHERE RequestID=@RequestID", con);
                cmd.Parameters.AddWithValue("@Status", newStatus);
                cmd.Parameters.AddWithValue("@RequestID", requestId);
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);
            UpdateStatus(requestId, "Approved");

            lblMessage.CssClass = "success";
            lblMessage.Text = "Request approved.";
            LoadRequests();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);
            UpdateStatus(requestId, "Rejected");

            lblMessage.CssClass = "error";
            lblMessage.Text = "Request rejected.";
            LoadRequests();
        }
    }
}