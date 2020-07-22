using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaPresentacion.Custom;

namespace CapaPresentacion
{
    public partial class PanelGeneral : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

            }

            Response.Write("user: " + Session["usuario"]);

            //if (Session["usuario"].Equals("usuario"))
            //{
            //    Response.Redirect("PanelGeneral.aspx");
            //}
            if (Session["usuario"].Equals("docente"))
            {
                Response.Redirect("RegistrarDocente.aspx");
            }
            if (Session["usuario"].Equals("alumno"))
            {
                Response.Redirect("Registrar.aspx");
            }
            if (Session["usuario"].Equals("director"))
            {
                Response.Redirect("PanelGeneral.aspx");
            }
            if (Session["usuario"].Equals("secretaria"))
            {
                Response.Redirect("Registrar.aspx");
            }
            //else
            //{
            //    Response.Redirect("Index.aspx");
            //}
        }
    }
}