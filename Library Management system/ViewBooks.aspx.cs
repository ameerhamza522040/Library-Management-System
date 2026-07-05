using System;
using System.Data;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public partial class ViewBooks : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        // ✅ Method to Load All Books
        private void LoadBooks()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string query = "SELECT BookId, Title, Author, ISBN, TotalCopies, AvailableCopies FROM ABooks";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // 🔍 Method to Search Books by Title or Author
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string searchText = txtSearch.Text.Trim();
                string query = "SELECT BookId, Title, Author, ISBN, TotalCopies, AvailableCopies FROM ABooks WHERE Title LIKE @Search OR Author LIKE @Search";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@Search", "%" + searchText + "%");

                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}

