using Library_Management_system;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Library_Management_system
{
    public partial class ManageBooks : AdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks()
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                string query = "SELECT * FROM ABooks"; // Updated table name
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewBooks.DataSource = dt;
                GridViewBooks.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = Connection.GetConnection())
            {
                SqlCommand cmd;
                if (!string.IsNullOrEmpty(hfBookID.Value))
                {
                    cmd = new SqlCommand("UPDATE ABooks SET Title=@Title, Author=@Author, ISBN=@ISBN, TotalCopies=@TotalCopies, AvailableCopies=@AvailableCopies WHERE BookID=@BookID", con);
                    cmd.Parameters.AddWithValue("@BookID", hfBookID.Value);
                }
                else
                {
                    cmd = new SqlCommand("INSERT INTO ABooks (Title, Author, ISBN, TotalCopies, AvailableCopies) VALUES (@Title, @Author, @ISBN, @TotalCopies, @AvailableCopies)", con);
                }

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.Trim());
                cmd.Parameters.AddWithValue("@ISBN", txtISBN.Text.Trim());
                cmd.Parameters.AddWithValue("@TotalCopies", txtTotalCopies.Text.Trim());
                cmd.Parameters.AddWithValue("@AvailableCopies", txtAvailableCopies.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearForm();
            LoadBooks();
        }

        private void ClearForm()
        {
            txtTitle.Text = txtAuthor.Text = txtISBN.Text = txtTotalCopies.Text = txtAvailableCopies.Text = "";
            hfBookID.Value = "";
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int bookID = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);
            using (SqlConnection con = Connection.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM ABooks WHERE BookID=@BookID", con);
                cmd.Parameters.AddWithValue("@BookID", bookID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfBookID.Value = dr["BookID"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtAuthor.Text = dr["Author"].ToString();
                    txtISBN.Text = dr["ISBN"].ToString();
                    txtTotalCopies.Text = dr["TotalCopies"].ToString();
                    txtAvailableCopies.Text = dr["AvailableCopies"].ToString();
                }
                con.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int bookID = Convert.ToInt32((sender as System.Web.UI.WebControls.Button).CommandArgument);

            try
            {
                using (SqlConnection con = Connection.GetConnection())
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM ABooks WHERE BookID=@BookID", con);
                    cmd.Parameters.AddWithValue("@BookID", bookID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                lblMessage.CssClass = "success";
                lblMessage.Text = "Book deleted successfully.";
            }
            catch (SqlException ex) when (ex.Number == 547) // FK constraint violation
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "This book cannot be deleted because it has issued-book records. Please clear its history first.";
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "error";
                lblMessage.Text = "❌ Error: " + ex.Message;
            }

            LoadBooks();
        }

        protected void GridViewBooks_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

