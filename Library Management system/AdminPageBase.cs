using System;
using System.Web.UI;

namespace Library_Management_system
{
    public class AdminPageBase : Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}