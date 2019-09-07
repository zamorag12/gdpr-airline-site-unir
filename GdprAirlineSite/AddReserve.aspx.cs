using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Threading;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GdprAirlineSite.converters;
using GdprAirlineSite.models;
using RestSharp;

namespace GdprAirlineSite
{
    public partial class AddReserve : Page
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
        protected void Submit_Game_Click(object sender, EventArgs e)
        {
            try
            {
                Session["idUser"].ToString();
            }
            catch (Exception exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Error desconocido.');",
                    true);
                return;
            }

            btnSubmit.Visible = false;

            //Get values from form
            string pais = paisTxtBox.Text;

            //WS call
            RestClient clientRest = new RestClient(ConfigurationManager.AppSettings["BaseURL"]);
            RestRequest request = new RestRequest("/gdpr-unir-api/v1/cities", Method.POST);
            request.RequestFormat = DataFormat.Json;
            request.AddBody(new
            {
                name = pais,
                location = pais,
                user_id = Convert.ToInt32(Session["idUser"].ToString()),
            });

            IRestResponse<CityReserve> responsePost = clientRest.Execute<CityReserve>(request);

            String myStringVariable = "";
            if (responsePost.StatusCode.ToString() == "Created")
            {
                myStringVariable = "Reserva para " + responsePost.Data.Name + " creada exitosamente";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');",
                    true);
            }
            else
            {
                myStringVariable = "Error: Error desconocido.";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');",
                    true);
            }

            btnSubmit.Visible = true;
        }
    }
}