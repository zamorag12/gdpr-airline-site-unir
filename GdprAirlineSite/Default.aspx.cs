using System;
using System.Web.Security;
using System.Web.UI;

namespace GdprAirlineSite
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            var returnUrl = "/default.aspx";
            
            Session.Clear();
            Session.RemoveAll();
            FormsAuthentication.SignOut();
            
            Response.Redirect(
               returnUrl);
        }
    }
}