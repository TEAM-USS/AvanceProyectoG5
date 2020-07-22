using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class RegistrarAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {               
                

            }
        }
        [WebMethod]
        public static List<Alumno> ListarAlumnos()
        {
            List<Alumno> Lista = null;
            try
            {
                Lista = AlumnoLN.getInstance().ListarAlumnos();
            }
            catch
            {
                Lista = null;
            }
            return Lista;
        }

        [WebMethod]
        public static bool ActualizarDatosAlumno(string id, string direccionAlum)
        {
       Alumno objPaciente = new Alumno()
        {
        IdAlumno = Convert.ToInt32(id),
        Direccion = direccionAlum
       };

        bool ok = AlumnoLN.getInstance().Actualizar(objPaciente);
        return ok;
        }

        [WebMethod]
        public static bool EliminarDatosAlumno(string id)
        {
            Int32 idAlumno = Convert.ToInt32(id);
            bool ok = false;

            ok = AlumnoLN.getInstance().Eliminar(idAlumno);

            return ok;

        }

        private Alumno GetEntity()
        {
            Alumno objPaciente = new Alumno();
            objPaciente.IdAlumno = 0;
            objPaciente.Nombres = txtNombres.Text;
            objPaciente.ApPaterno = txtApPaterno.Text;
            objPaciente.ApMaterno = txtApMaterno.Text;
            objPaciente.Edad = Convert.ToInt32(txtEdad.Text);
            objPaciente.Sexo = (ddlSexo.SelectedValue == "Femenino") ? 'F' : 'M'; 
            objPaciente.NroDocumento = txtNroDocumento.Text;
            objPaciente.Direccion = txtDireccion.Text;
            objPaciente.Telefono = txtTelefono.Text;
            objPaciente.Estado = true;

            return objPaciente;
        }

        
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Alumno objPaciente = GetEntity();
            //enviar a la capaLN
            bool response = AlumnoLN.getInstance().RegistrarAlumno(objPaciente);
            if (response == true)
            {
                Response.Write("<script>alert('Registro correcto)</script>");
            }
            else
            {
                Response.Write("<script>alert('Registro incorrecto!!!')</script>");
            }
            Limpiar();
        }

        public void Limpiar()
        {
            txtNombres.Text="";
            txtApPaterno.Text="";
            txtApMaterno.Text="";
            txtEdad.Text="";            
            txtNroDocumento.Text="";
            txtDireccion.Text="";
            txtTelefono.Text="";
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
            Response.Redirect("PanelGeneral.aspx");
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteAlumno.aspx");
        }
    }
}