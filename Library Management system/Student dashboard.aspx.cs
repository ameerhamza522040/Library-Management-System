using Library_Management_system;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Library_Management_System
{
    public partial class StudentDashboard : StudentPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        protected void btnRequestBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestBook.aspx");
        }

        protected void btnMyIssuedBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyIssuedBooks.aspx");
        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Student"] = null;
            Response.Redirect("Main.aspx");
        }
    }
}
