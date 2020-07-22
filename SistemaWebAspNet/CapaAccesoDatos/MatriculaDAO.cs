using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class MatriculaDAO
    {
        #region "PATRON SINGLETON"
        private static MatriculaDAO daoMatricula = null;
        private MatriculaDAO() { }
        public static MatriculaDAO getInstance()
        {
            if (daoMatricula == null)
            {
                daoMatricula = new MatriculaDAO();
            }
            return daoMatricula;
        }
        #endregion
        public bool RegistrarMatricula(int alumno, int grado, int curso)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionDB();
                cmd = new SqlCommand("spMatricula", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ALUMNO", alumno);
                cmd.Parameters.AddWithValue("@GRADO", grado);
                cmd.Parameters.AddWithValue("@CURSO", curso);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

    }
}
