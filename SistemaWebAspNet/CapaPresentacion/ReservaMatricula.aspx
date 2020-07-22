<%@ Page Language="C#"  MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ReservaMatricula.aspx.cs" Inherits="CapaPresentacion.ReservaMatricula" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE MATRICULAS</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">

                   <%--  <form id="form1" runat="server">--%>

                        <div class="form-group">
                            <label>ID DE ALUMNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtidAlumno" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>INGRESE GRADO</label>
                        </div>
                        <div class="form-group">
                                <asp:DropDownList runat="server" ID="TxtidGrado">
                                <asp:ListItem Text="ELEGIR GRADO" Value="1" Selected="true" />
                                <asp:ListItem Text="PRIMERO" Value="1" />
                                   <asp:ListItem Text="SEGUNDO" Value="2"/>
                                    <asp:ListItem Text="TERCERO" Value="3"/>
                                     <asp:ListItem Text="CUARTO" Value="4"/>
                                    <asp:ListItem Text="QUINTO" Value="5"/>
                                    <asp:ListItem Text="SEXTO" Value="6"/>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>ID CURSO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList runat="server" ID="TxtidCurso">
                                <asp:ListItem Text="ELEGIR UN CURSO" Value="1" Selected="true" />
                                <asp:ListItem Text="Matematica" Value="1" />
                                   <asp:ListItem Text="Ingles" Value="2"/>
                                    <asp:ListItem Text="Historia" Value="3"/>
                                     <asp:ListItem Text="Quimica" Value="4"/>
                            </asp:DropDownList>
                        </div>

                        <div class="footer" >
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn bg-teal btn-block" style="margin-top: 0" OnClick="btnIngresar_Click1" />
                        </div>  

                     <%--   </form> --%>
                        </div>    
                            
                    </div>
                </div>
            </div>
 </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
