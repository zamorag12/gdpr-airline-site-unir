<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReserve.aspx.cs" Inherits="GdprAirlineSite.AddReserve" %>

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
    <link rel="shortcut icon" type="image/ico" href="images/favicon.ico" />
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
    <form id="formPool" runat="server">
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
                        <li>
                            <a href="Default.aspx">Inicio</a>
                            <%--</li>--%>
                            <li>
                                <a href="Reserves.aspx">Mis Reservas</a>
                            </li>
                            <li class="active">
                                <a href="AddReserve.aspx">Agregar Reserva</a>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" OnClick="Logout_Click" Text="Salir" />
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
                    <!-- Item Table-->
                    <div class="col-lg-6">
                        <i class="fas fa-cloud"></i>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalCreate">Agregar Reserva</button>
                    </div>
                </div>
            </div>
        </header>
        <!--Header-area/-->
        <!-- Modal Creation -->
        <div class="modal fade" id="myModalCreate" role="dialog">
            <div runat="server" class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Agregar Reserva</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <h2>Ingresar Reserva</h2>

                        <div class="messages"></div>

                        <div class="controls" runat="server">

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="poolName">Reserva </label>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="labelE1">País destino</asp:Label>
                                        <asp:TextBox runat="server" ID="paisTxtBox" type="text" name="País" class="form-control" placeholder="Ingresa el país destino. *" required="required" data-error="Campo requerido.">
                                        </asp:TextBox>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-info btn-lg" runat="server" Text="Guardar" OnClick="Submit_Game_Click" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="text-muted"><strong>*</strong> Campos requeridos.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer-area relative sky-bg" id="contact-page">
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <p>&copy; Made with <i class="ti-heart" aria-hidden="true"></i>by <a href="http://gdpr site zamora gustavo unir.com">gdpr site zamora gustavo unirDEV</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </form>

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
</body>
</html>
