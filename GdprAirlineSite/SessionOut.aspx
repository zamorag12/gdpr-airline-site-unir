<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionOut.aspx.cs" Inherits="GdprAirlineSite.SessionOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheets/login.css" rel="stylesheet" type="text/css" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div id="conte_login">
            <div id="logo_login">
            </div>

            <div id="cuerpo_aviso">


                <asp:Label ID="Label1" Visible="true" runat="server" CssClass="alerta_texto" Text="Cerrando Sesión, vuelva pronto..."></asp:Label>

                <br />
                <br />


                <asp:Image ID="Image1" runat="server" ImageUrl="https://media3.giphy.com/media/Oab4PXZpIoG76/giphy.gif" />



            </div>

        </div>

    </form>
</body>
</html>
