using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
   public class MatriculaLN
    {
        #region "PATRON SINGLETON"
        //private static MatriculaLN objEmpleado = null;
        public MatriculaLN() {

        
        }
        //public static MatriculaLN getInstance()
        //{
        //    if (objEmpleado == null)
        //    {
        //        objEmpleado = new AlumnoLN();
        //    }
        //    return objEmpleado;
        //}
        #endregion
        public bool RegistrarMatricula(int alumno, int grado, int curso)
        {
            try
            {
                return MatriculaDAO.getInstance().RegistrarMatricula(alumno, grado, curso);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }





    }
}
