<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GdprAirlineSite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="author" content="gdpr site zamora gustavo unir">
    <meta name="description" content="gdpr site zamora gustavo unir">
    <meta name="keywords" content="gdpr site zamora gustavo unira">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>Inicio - Voling Site Gdpr Simulation Test</title>
    <!-- Place favicon.ico in the root directory -->
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="shortcut icon" type="image/ico" href="images/favicon.ico"/>
    <!-- Plugin-CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/animate.css">
    <!-- Main-Stylesheets -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="https://cdn.auth0.com/js/lock/10.8.0/lock.min.js"></script>
    <script type="text/javascript">
        var lock = new Auth0Lock(
            "<%= System.Configuration.ConfigurationManager.AppSettings["auth0:ClientId"] %>",
            "<%= System.Configuration.ConfigurationManager.AppSettings["auth0:Domain"] %>",
            {
                auth: {
                    redirectUrl: window.location.origin + '/LoginCallback.ashx',
                    responseType: 'code',
                    params: {
                        scope: 'openid profile'
                    }
                }
            }
        );
    </script>
</head>

<body data-spy="scroll" data-target="#primary-menu" style="overflow-x: hidden; overflow-y: scroll;">
<div class="preloader">
    <div class="sk-folding-cube">
        <div class="sk-cube1 sk-cube"></div>
        <div class="sk-cube2 sk-cube"></div>
        <div class="sk-cube4 sk-cube"></div>
        <div class="sk-cube3 sk-cube"></div>
    </div>
</div>
<form runat="server">
    <!--Mainmenu-area-->
    <div class="mainmenu-area" data-spy="affix" data-offset-top="100">
        <div class="container">
            <!--Logo-->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-menu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand logo">
                    <h2>Voling Site GDPR</h2>
                </a>
            </div>
            <!--Logo/-->
            <nav class="collapse navbar-collapse" id="primary-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="Default.aspx">Inicio</a>
                    </li>
                    <li >
                        <a href="Reserves.aspx">Mis Reservas</a>
                    </li>
                     <li >
                        <a href="AddReserve.aspx">Agregar Reserva</a>
                    </li>
                    <li>
                        <asp:LinkButton runat="server" OnClick="Logout_Click" Text="Salir"/>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!--Mainmenu-area/-->


    <!--Header-area-->
    <header class="header-area overlay full-height relative v-center" id="home-page">
        <div class="absolute anlge-bg"></div>
        <div class="container">
            <div class="row v-center">
                <div runat="server" class="col-xs-12 col-md-7 header-text">
                    <% if (!Request.IsAuthenticated)
                       { %>
                        <script type="text/javascript">
                            lock.show();
                        </script>
                        <%-- <button onclick="lock.show()">Login</button> --%>
                    <% }
                       else
                       { %>
                        <p>
                            Bienvenid@ <%= User.Identity.Name %> <br/>
                        </p>
                    <% } %>
                </div>
            </div>
        </div>
    </header>
    <!--Header-area/-->

    <footer class="footer-area relative sky-bg" id="contact-page">
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <p>&copy; Made with <i class="ti-heart" aria-hidden="true"></i> by <a href="http://gdpr site zamora gustavo unir.com"> gdpr site zamora gustavo unirDEV</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <!--Vendor-JS-->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <!--Plugin-JS-->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/contact-form.js"></script>
    <script src="js/jquery.parallax-1.1.3.js"></script>
    <script src="js/scrollUp.min.js"></script>
    <script src="js/magnific-popup.min.js"></script>
    <script src="js/wow.min.js"></script>
    <!--Main-active-JS-->
    <script src="js/main.js"></script>
</form>
</body>
</html>