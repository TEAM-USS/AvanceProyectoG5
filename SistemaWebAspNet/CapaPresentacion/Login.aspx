<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>

<!DOCTYPE html>

<html class="bg-aqua-gradient" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Acceso al Sistema</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />    
</head>
 <body class="bg-aqua-gradient">
    <div class="form-box" id="login-box">
       
        <form id="form1" runat="server">
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="NuevaAuth" Width="100%">
        <LayoutTemplate>
        <div class="header">Login</div>
        
            <div class="body bg-gray">
                <div class="form-group">
                    <asp:TextBox ID="UserName" CssClass="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="Password" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>                
               <%-- <asp:HyperLink ID="hpl1" href="RegistrarUsuario.aspx" runat="server"></asp:HyperLink>--%>
            </div>
            <div class="footer" >
                <asp:Button ID="btnIngresar" CommandName="Login" runat="server" Text="Iniciar Sesión" CssClass="btn bg-teal btn-block" style="margin-top: 0" OnClick="btnIngresar_Click1" />
            </div>    
           
        
       </LayoutTemplate>
   </asp:Login>
            </form>
    </div>
       
</body>
    <script src="js/jquery-3.1.0.min.js"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>



