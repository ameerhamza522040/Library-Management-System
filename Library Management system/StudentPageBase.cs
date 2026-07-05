using System;
using System.Web.UI;

namespace Library_Management_system
{
    public class StudentPageBase : Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Session["StudentID"] == null)
            {
                Response.Redirect("StudentLogin.aspx");
            }
        }
    }
}