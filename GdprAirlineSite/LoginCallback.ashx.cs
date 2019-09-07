using System.Net;
using System.Net.Http;
using System.Web.SessionState;
using RestSharp;
using HttpContext = System.Web.HttpContext;

namespace GdprAirlineSite
{
	using Auth0.AspNet;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Linq;
    using System.Web;
	using static HttpContext;

    public class LoginCallback : IHttpHandler, IRequiresSessionState 
    {
        private readonly Auth0Client client = new Auth0Client(ConfigurationManager.AppSettings["auth0:Domain"],
                ConfigurationManager.AppSettings["auth0:ClientId"],
                ConfigurationManager.AppSettings["auth0:ClientSecret"]);

        public void ProcessRequest(HttpContext context)
        {
            var token = client.ExchangeAuthorizationCodePerAccessToken(context.Request.QueryString["code"], context.Request.Url.ToString());
            var profile = client.GetUserInfo(token);

            var user = new List<KeyValuePair<string, object>>
            {
                new KeyValuePair<string, object>("name", profile.Name),
                new KeyValuePair<string, object>("nickname", profile.Nickname),
                new KeyValuePair<string, object>("picture", profile.Picture)
            };

            try
            {
                RestClient clientRest = new RestClient(ConfigurationManager.AppSettings["BaseURL"]);
                RestRequest requestSearch = new RestRequest("/gdpr-unir-api/v1/users?email=" + profile.Nickname + "@gmail.com", Method.GET);
                requestSearch.AddHeader("Authorization", token.IdToken);
                IRestResponse<models.User> responseGet = clientRest.Execute<models.User>(requestSearch);
                Current.Session.Add("idUser", responseGet.Data.UserId);
            }
            catch (Exception e)
            {
                Current.Session.Add("idUser", "500 error");
                Console.WriteLine(e);
            }

            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(profile.Nickname, true);
            
            var returnTo = "/Default.aspx";
			var state = context.Request.QueryString["state"];
            if (state != null)
            {
                var stateValues = HttpUtility.ParseQueryString(context.Request.QueryString["state"]);
                var redirectUrl = stateValues["ru"];

                // check for open redirection
                if (redirectUrl != null && IsLocalUrl(redirectUrl))
                {
                    returnTo = redirectUrl;
                }
            }

            context.Response.Redirect(returnTo);
        }

        public bool IsReusable { get { return false; } }

        private bool IsLocalUrl(string url)
        {
            return !String.IsNullOrEmpty(url)
                && url.StartsWith("/")
                && !url.StartsWith("//")
                && !url.StartsWith("/\\");
        }
    }
}