using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicaNegocio;

namespace CapaPresentacion
{
    public partial class ReservaMatricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            int n1, n2, n3;
            n1 = Convert.ToInt32(TxtidAlumno.Text);
            n2 = Convert.ToInt32(TxtidGrado.Text);
            n3 = Convert.ToInt32(TxtidCurso.Text);

            MatriculaLN omatri = new MatriculaLN();

           bool rspta = omatri.RegistrarMatricula(n1, n2, n3);
            if (rspta)
            {

                Response.Write("<script>alert('Matricula Registrada.')</script>");

            }
            else {

                Response.Write("<script>alert('Matricula NO Registrada.')</script>");
            }

        }
    }
}