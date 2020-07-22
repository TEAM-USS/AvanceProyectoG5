using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;


namespace CapaLogicaNegocio
{
    public class EmpleadoLN
    {
        #region "PATRON SINGLETON"
        private static EmpleadoLN objEmpleadoLN = null;
        private EmpleadoLN() { }

        public static EmpleadoLN getInstance()
        {
            if (objEmpleadoLN == null)
            {
                objEmpleadoLN = new EmpleadoLN();
            }
            return objEmpleadoLN;
        }
        #endregion

        public Empleado AccesoSistema(String user, String pass)
        {
            try
            {
                return EmpleadoDAO.getInstance().AccesoSistema(user, pass);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
