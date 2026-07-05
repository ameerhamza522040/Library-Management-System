using System;
using System.Data;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class MyIssuedBooks : StudentPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadIssuedBooks();
            }
        }

        // ✅ Method to Load All Issued Books
        private void LoadIssuedBooks()
        {
            int studentId = Convert.ToInt32(Session["StudentID"]);

            using (SqlConnection con = Connection.GetConnection())
            {
                try
                {
                    string query = @"SELECT ib.IssueID, ab.Title AS BookTitle, ib.IssueDate, ib.DueDate, ib.Status
                              FROM IssuedBooks ib
                              JOIN ABooks ab ON ib.BookID = ab.BookID
                              WHERE ib.StudentID = @StudentID";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.SelectCommand.Parameters.AddWithValue("@StudentID", studentId);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewIssuedBooks.DataSource = dt;
                    GridViewIssuedBooks.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("❌ Error: " + ex.Message);
                }
            }
        }
    }
}
