<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ReportePorAlumno.aspx.cs" Inherits="CapaPresentacion.ReportePorAlumno" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <h1 style="text-align: center">Reporte de Alumnos</h1>
    
        CÓDIGO DE ALUMNO&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="69px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="IMPRIMIR" />
    </p>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="840px">
    </rsweb:ReportViewer>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
