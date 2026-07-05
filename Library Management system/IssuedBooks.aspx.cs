using Library_Management_system;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Library_Management_system
{
    public partial class IssuedBooks : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadBooks();
                LoadIssuedGrid();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT StudentID, StudentName FROM Students", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlStudents.DataSource = dt;
                ddlStudents.DataTextField = "StudentName";
                ddlStudents.DataValueField = "StudentID";
                ddlStudents.DataBind();
                ddlStudents.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Student--", "0"));
            }
        }

        private void LoadBooks()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT BookID, Title, AvailableCopies FROM ABooks WHERE AvailableCopies > 0", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlBooks.DataSource = dt;
                ddlBooks.DataTextField = "Title";
                ddlBooks.DataValueField = "BookID";
                ddlBooks.DataBind();
                ddlBooks.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Book--", "0"));
            }
        }

        // NEW: loads the grid of all issued books (Issued + Returned) for the admin view
        private void LoadIssuedGrid()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string query = @"SELECT ib.IssueID, s.StudentName, ab.Title, ib.IssueDate, ib.DueDate, ib.Status
                                  FROM IssuedBooks ib
                                  JOIN Students s ON ib.StudentID = s.StudentID
                                  JOIN ABooks ab ON ib.BookID = ab.BookID
                                  ORDER BY ib.IssueID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewIssued.DataSource = dt;
                GridViewIssued.DataBind();
            }
        }

        protected void GridViewIssued_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                DateTime dueDate = Convert.ToDateTime(row["DueDate"]);
                string status = row["Status"].ToString();

                if (status == "Issued" && dueDate < DateTime.Now)
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 205, 210); // light red
                    e.Row.ForeColor = System.Drawing.Color.FromArgb(183, 28, 28);   // dark red text
                }
            }
        }
        protected void btnIssue_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            int studentID = Convert.ToInt32(ddlStudents.SelectedValue);
            int bookID = Convert.ToInt32(ddlBooks.SelectedValue);
            DateTime dueDate;

            if (studentID == 0 || bookID == 0 || !DateTime.TryParse(txtDueDate.Text, out dueDate))
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "Please select valid student, book, and due date.";
                return;
            }

            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();

                // Check student eligibility: no more than 3 books issued
                SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM IssuedBooks WHERE StudentID=@StudentID AND Status='Issued'", con);
                cmdCheck.Parameters.AddWithValue("@StudentID", studentID);
                int issuedCount = (int)cmdCheck.ExecuteScalar();
                if (issuedCount >= 3)
                {
                    lblMessage.CssClass = "error";
                    lblMessage.Text = "Student has already issued maximum number of books.";
                    return;
                }

                // Check book availability
                SqlCommand cmdAvail = new SqlCommand("SELECT AvailableCopies FROM ABooks WHERE BookID=@BookID", con);
                cmdAvail.Parameters.AddWithValue("@BookID", bookID);
                int available = (int)cmdAvail.ExecuteScalar();
                if (available <= 0)
                {
                    lblMessage.CssClass = "error";
                    lblMessage.Text = "Selected book is not available.";
                    return;
                }

                // Issue book
                SqlCommand cmdIssue = new SqlCommand("INSERT INTO IssuedBooks (StudentID, BookID, DueDate, Status) VALUES (@StudentID, @BookID, @DueDate, 'Issued')", con);
                cmdIssue.Parameters.AddWithValue("@StudentID", studentID);
                cmdIssue.Parameters.AddWithValue("@BookID", bookID);
                cmdIssue.Parameters.AddWithValue("@DueDate", dueDate);
                cmdIssue.ExecuteNonQuery();

                // Update available copies
                SqlCommand cmdUpdateBook = new SqlCommand("UPDATE ABooks SET AvailableCopies = AvailableCopies - 1 WHERE BookID=@BookID", con);
                cmdUpdateBook.Parameters.AddWithValue("@BookID", bookID);
                cmdUpdateBook.ExecuteNonQuery();

                lblMessage.CssClass = "success";
                lblMessage.Text = "Book issued successfully!";
                LoadBooks(); // refresh dropdown
            }

            LoadIssuedGrid(); // NEW: refresh the issued-books grid after a new issue
        }

        // NEW: marks a book as returned and restores its available copy count
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            int issueId = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);

            using (SqlConnection con = Connection.GetConnection())
            {
                con.Open();

                // Find which book this issue record refers to
                SqlCommand cmdGetBook = new SqlCommand("SELECT BookID FROM IssuedBooks WHERE IssueID=@IssueID", con);
                cmdGetBook.Parameters.AddWithValue("@IssueID", issueId);
                int bookId = (int)cmdGetBook.ExecuteScalar();

                // Mark this issue record as returned
                SqlCommand cmdReturn = new SqlCommand("UPDATE IssuedBooks SET Status='Returned' WHERE IssueID=@IssueID", con);
                cmdReturn.Parameters.AddWithValue("@IssueID", issueId);
                cmdReturn.ExecuteNonQuery();

                // Restore the available copy count
                SqlCommand cmdRestore = new SqlCommand("UPDATE ABooks SET AvailableCopies = AvailableCopies + 1 WHERE BookID=@BookID", con);
                cmdRestore.Parameters.AddWithValue("@BookID", bookId);
                cmdRestore.ExecuteNonQuery();
            }

            lblMessage.CssClass = "success";
            lblMessage.Text = "Book marked as returned.";

            LoadBooks();       // refresh the "Select Book" dropdown (copy count changed)
            LoadIssuedGrid();  // refresh the grid
        }
    }
}