using CapaEntidades;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class ReportePorAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetData();
        }

        private void GetData()
        {
            Alumno objAlumno = new Alumno();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=.; Initial Catalog=dbColegioLE; User ID=sa; Password=sasa";
            SqlDataAdapter da = new SqlDataAdapter("select * from Alumno where idalumno= '" + Convert.ToInt32(TextBox1.Text) + "'", con);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReporteAlumno.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}