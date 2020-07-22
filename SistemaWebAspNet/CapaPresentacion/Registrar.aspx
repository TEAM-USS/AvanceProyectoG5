<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="CapaPresentacion.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-language" content="es" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sistema Web ASP.NET</title>    
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="jAlert/jquery.alerts.css" rel="stylesheet" type="text/css" />

            <!-- DataTables -->
            <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" />
            <style>
                 html, body {
            min-height: 100%;
            padding: 0;
            margin: 0;
            font-family: 'Source Sans Pro', "Helvetica Neue", Helvetica, Arial, sans-serif;
        }

        iframe {
            display: block;
            overflow: auto;
            border: 0;
            margin: 0;
            padding: 0;
            margin: 0 auto;
        }

        .frame {
            height: 49px;
            margin: 0;
            padding: 0;
            border-bottom: 1px solid #ddd;
        }

            .frame a {
                color: #666;
            }

                .frame a:hover {
                    color: #222;
                }

            .frame .buttons a {
                height: 49px;
                line-height: 49px;
                display: inline-block;
                text-align: center;
                width: 50px;
                border-left: 1px solid #ddd;
            }

            .frame .brand {
                color: #444;
                font-size: 20px;
                line-height: 49px;
                display: inline-block;
                padding-left: 10px;
            }

                .frame .brand small {
                    font-size: 14px;
                }

        a, a:hover {
            text-decoration: none;
        }

        .container-fluid {
            padding: 0;
            margin: 0;
        }

        .text-muted {
            color: #999;
        }

        .ad {
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            background: #222;
            background: rgba(0,0,0,0.8);
            width: 100%;
            color: #fff;
            display: none;
        }

        #close-ad {
            float: left;
            margin-left: 10px;
            margin-top: 10px;
            cursor: pointer;
        }

        #close {
            cursor: pointer;
        }

        #no-cursor {
            cursor: none;
        }
        
            </style>
    
</head>
<body class="skin-blue">
    <%--CABECERA DE PAGINA MAESTRA--%>
    <header class="header">
        <a href="#" class="logo"></a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu no-cursor">
                        <a href="cerrar.aspx">
                            <i class="glyphicon glyphicon-user"></i>
                            <span id="close">Cerrar Sesión</span>        
                                                  
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <%--END DE CABECERA--%>
    </header>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="left-side sidebar-offcanvas">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="img/escudo.png" class="img-circle" alt="User Image"/>
                    </div>
                    <div class="pull-left info">
                        <p></p>
                        <p>
                            <asp:Label runat="server" ID="txtUser"></asp:Label>
                        </p>
                    </div>
                </div>
                <ul class="sidebar-menu">
                    <li class="active">
                        <a href="#">
                            <i class="fa fa-dashboard"></i>
                            <span>Panel General</span>
                        </a>
                    </li>
                     <li class="active">
                        <a href="#">
                            <i class="fa fa-dashboard"></i>
                            <span>Reserva de Matrícula</span>
                        </a>
                    </li>  
                    <li class="inactive">
                        <a href="#">
                            <i class="fa fa-dashboard"></i>
                            <span>Docentes</span>
                        </a>
                    </li>   
                    <li class="active">
                        <a href="#">
                            <i class="fa fa-dashboard"></i>
                            <span>Horarios</span>
                        </a>
                    </li>   
                    <li class="active">
                        <a href="#">
                            <i class="fa fa-dashboard"></i>
                            <span>Reportes</span>
                        </a>
                    </li>
                    
                </ul>
            </section>
        </aside>
        <aside class="right-side">
        <section class="content-header">
            I.E. Leonard Euler
        </section>
        <section class="content">
            <form id="form1" runat="server">
                <asp:ScriptManager ID="scriptManager" runat="server">
                    </asp:ScriptManager>
                <div>
                </div>
                <section class="content-header">
        <h1 style="text-align: center">REGISTRARSE</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>DOCUMENTO DE IDENTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNroDocumento" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO PATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApPaterno" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO MATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApMaterno" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>SEXO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>EDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEdad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>TELÉFONO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>DIRECCIÓN</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDireccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!-- Datatable Part ==> ListarAlumnoss -->

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Alumnos</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_pacientes" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Acciones</th>
                                    <th>Código</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Sexo</th>
                                    <th>Edad</th>
                                    <th>Dirección</th>                                    
                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Datatable -->
    </section>

    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar registro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>NOMBRES Y APELLIDOS</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtFullName" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DIRECCIÓN</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalDireccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>
            </form>
        </section>
    </aside>
    </div><!--fin del wraper-->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/AdminLTE/app.js" type="text/javascript"></script>
    <script src="jAlert/jquery.alerts.js" type="text/javascript"></script>
    <script src="js/jquery.ui.draggable.js" type="text/javascript"></script>

    <script src="js/plugins/datatables/jquery.dataTables.js"></script>
    <script src="js/plugins/datatables/dataTables.bootstrap.js"></script>
    <script src="js/logout.js"></script>
       
</body>
</html>
