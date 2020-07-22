using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
    public class AlumnoLN
    {
        #region "PATRON SINGLETON"
        private static AlumnoLN objEmpleado = null;
        private AlumnoLN() { }
        public static AlumnoLN getInstance()
        {
            if (objEmpleado == null)
            {
                objEmpleado = new AlumnoLN();
            }
            return objEmpleado;
        }
        #endregion

        public bool RegistrarAlumno(Alumno objAlumno)
        {
            try
            {
                return AlumnoDAO.getInstance().RegistrarAlumno(objAlumno);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Alumno> ListarAlumnos()
        {
            try
            {
                return AlumnoDAO.getInstance().ListarAlumnos();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public bool Actualizar(Alumno objPaciente)
        {
            try
            {
                return AlumnoDAO.getInstance().Actualizar(objPaciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Eliminar(int id)
        {
            try
            {
                return AlumnoDAO.getInstance().Eliminar(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
