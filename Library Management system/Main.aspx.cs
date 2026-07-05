using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class MainPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Admin Login Button Click
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        // Student Login Button Click
        protected void btnStudentLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentLogin.aspx");//
        }

        // Student Register Link Click
        protected void btnStudentRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
        }
    }
}

