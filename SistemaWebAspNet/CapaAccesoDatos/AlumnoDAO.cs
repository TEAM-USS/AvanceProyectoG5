using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAccesoDatos
{
    public class AlumnoDAO
    {
        #region "PATRON SINGLETON"
        private static AlumnoDAO daoEmpleado = null;
        private AlumnoDAO() { }
        public static AlumnoDAO getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new AlumnoDAO();
            }
            return daoEmpleado;
        }
        #endregion

        public bool RegistrarAlumno(Alumno objAlumno)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarAlumno", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombres", objAlumno.Nombres);
                cmd.Parameters.AddWithValue("@prmApPaterno", objAlumno.ApPaterno);
                cmd.Parameters.AddWithValue("@prmApMaterno", objAlumno.ApMaterno);
                cmd.Parameters.AddWithValue("@prmEdad", objAlumno.Edad);
                cmd.Parameters.AddWithValue("@prmSexo", objAlumno.Sexo);
                cmd.Parameters.AddWithValue("@prmNroDoc", objAlumno.NroDocumento);
                cmd.Parameters.AddWithValue("@prmDireccion", objAlumno.Direccion);
                cmd.Parameters.AddWithValue("@prmTelefono", objAlumno.Telefono);
                cmd.Parameters.AddWithValue("@prmEstado", objAlumno.Estado);
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

        public bool Eliminar(int id)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool ok = false;
            try
            {
                conexion = Conexion.getInstance().ConexionDB();
                cmd = new SqlCommand("spEliminarAlumno", conexion);
                cmd.Parameters.AddWithValue("@idAlumno", id);
                cmd.CommandType = CommandType.StoredProcedure;

                conexion.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }
            catch (Exception ex)
            {
                ok = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }

        public List<Alumno> ListarAlumnos()
        {
            List<Alumno> Lista = new List<Alumno>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                //return PacienteDAO.getInstance().ListarAlumnos();
                con = Conexion.getInstance().ConexionDB();
                cmd = new SqlCommand("spListarAlumno", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read()){
                    Alumno objPaciente = new Alumno();
                    objPaciente.IdAlumno = Convert.ToInt32(dr["idAlumno"].ToString());
                    objPaciente.Nombres = dr["nombres"].ToString();
                    objPaciente.ApPaterno = dr["apPaterno"].ToString();
                    objPaciente.ApMaterno = dr["apMaterno"].ToString();
                    objPaciente.Edad = Convert.ToInt32(dr["edad"].ToString());
                    objPaciente.Sexo = Convert.ToChar(dr["sexo"].ToString());
                    objPaciente.NroDocumento = dr["nroDocumento"].ToString();
                    objPaciente.Direccion = dr["direccion"].ToString();
                    //objAlumno.Telefono = dr["telefono"].ToString();
                    objPaciente.Estado = true;
                    
                    Lista.Add(objPaciente);

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return Lista;
        }

        public bool Actualizar(Alumno objPaciente)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionDB();
                cmd = new SqlCommand("spActualizarDatosAlumno3", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@prmIdAlumno", objAlumno.IdAlumno).ToString();
                //cmd.Parameters.AddWithValue("@prmDireccion", objAlumno.Direccion).ToString();
                cmd.Parameters.AddWithValue("@idAlumno", objPaciente.IdAlumno).ToString();
                cmd.Parameters.AddWithValue("@direccionAlum", objPaciente.Direccion).ToString();

                conexion.Open();

                cmd.ExecuteNonQuery();

                ok = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }



    }

}
