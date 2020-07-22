using CapaEntidades;
using CapaLogicaNegocio;
using CapaPresentacion.Custom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Session["UserSessionId"] = null;
            }
        }

        //--


        protected void NuevaAuth(object sender, AuthenticateEventArgs e)

        {
            bool auth = true;
            Response.Write("<script>alert('Ingreso test.')</script>");
            auth = Membership.ValidateUser(LoginUser.UserName, LoginUser.Password);
            Response.Write("<script>alert('Ingreso 2 " + auth + ".')</script>");
            if (auth)
            {

                Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(LoginUser.UserName, LoginUser.Password);

                if (objEmpleado != null)
                {
                    SessionManager = new SessionManager(Session);
                    SessionManager.UserSessionId = objEmpleado.ID.ToString();
                    //Session["usuario"] = null;
                    Response.Write("<script>alert('Ingreso 2.')</script>");

                    FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
                    // FormsAuthentication.RedirectToLoginPage("PanelGeneral.aspx");


                    //Response.Redirect("PanelGeneral.aspx");
                    Session["usuario"] = LoginUser.UserName;

                }
                else
                {
                    Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
                }




            }
            else
            {

                Response.Write("<script>alert('USUARIO INCORRECTO 2.')</script>");
            }
        }
            //---

            protected void btnIngresar_Click(object sender, AuthenticateEventArgs e)
            
        {
            bool auth = true;
            Response.Write("<script>alert('Ingreso test.')</script>");
            auth = Membership.ValidateUser(LoginUser.UserName, LoginUser.Password);
            Response.Write("<script>alert('Ingreso 2 " + auth + ".')</script>");
            if (auth)
            {

                Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(LoginUser.UserName, LoginUser.Password);
                
                if (objEmpleado != null)
                {
                    SessionManager = new SessionManager(Session);
                    SessionManager.UserSessionId = objEmpleado.ID.ToString();
                    //Session["usuario"] = null;
                    Response.Write("<script>alert('Ingreso 2.')</script>");

                    FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
                   // FormsAuthentication.RedirectToLoginPage("PanelGeneral.aspx");
                    
                    
                    //Response.Redirect("PanelGeneral.aspx");
                    Session["usuario"] = LoginUser.UserName;
 
                }
                else {
                    Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
                }


            
            
            }
            else
            {

                Response.Write("<script>alert('USUARIO INCORRECTO 2.')</script>");
            }






            //try
            //{
            //    DataSet1TableAdapters.EmpleadoTableAdapter obj = new DataSet1TableAdapters.EmpleadoTableAdapter();
            //    object userPass = obj.login(txtUsuario.Text, txtPassword.Text);
            //    //userPass = null;

            //    if (userPass != null)
            //    {
            //        Session["usuario"] = userPass;
            //        Response.Redirect("verificar.aspx");
            //    }

            //    else
            //    {
            //        //lblError.Text = "usuario o contraseña incorrectos ¿Desea registrarse?";
            //        hpl1.Text = "Solicitar acceso";

            //    }

            //}
            //catch
            //{
            //    Response.Write("<script>alert('Error al iniciar sesión')</script>");
            //}




            //***************descomentar

            //Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(txtUsuario.Text, txtPassword.Text);

            //try
            //{
            //    //if()
            //    if (objEmpleado != null)
            //    {
            //        Response.Write("<script>alert('Usuario correcto')</script>");
            //        Response.Redirect("PanelGeneral.aspx");
            //    }
            //    else
            //    {
            //        lblError.Text = "usuario o contraseña incorrectos";

            //    }
            //}
            //catch
            //{
            //    Response.Write("<script>alert('Usuario incorrecto!!!')</script>");
            //}




            //****************************************************************
            //if (objEmpleado != null)
            //{
            //    Response.Write("<script>alert('Usuario correcto')</script>");
            //    Response.Redirect("PanelGeneral.aspx");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Usuario incorrecto!!!')</script>");
            //}
        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Ingreso test.')</script>");
        }
    }
}