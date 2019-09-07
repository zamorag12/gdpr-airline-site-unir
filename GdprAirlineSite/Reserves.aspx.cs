using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GdprAirlineSite.converters;
using GdprAirlineSite.models;
using RestSharp;

namespace GdprAirlineSite
{
    public partial class Reserves : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Validar sesion
                try
                {
                    if (Session["idUser"].ToString() != "")
                    {

                    }
                }
                catch (Exception)
                {
                    Session.Abandon();
                    Session.Clear();
                    Session.RemoveAll();
                    FormsAuthentication.SignOut();
                    Response.Redirect("Default.aspx", false);
                }
            }
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