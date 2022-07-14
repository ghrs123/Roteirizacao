<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registar.aspx.cs" Inherits="Roteirizacao.registar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Registar | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/reset.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="https://localhost:44399/principal.aspx">
                        <span class="align-middle">Roteirização</span>
                    </a>
                    <ul class="sidebar-nav">
                        <li class="sidebar-header">Login
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/principal.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="main">
                <nav class="navbar navbar-expand navbar-light navbar-bg">
                    <a class="sidebar-toggle d-flex">
                        <i class="hamburger align-self-center"></i>
                    </a>
                    <div class="form-inline d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                            <input type="hidden" class="form-control" aria-label="Search" />
                        </div>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main class="content fundo">
                    <div class="content">
                        <div class="form">
                            <div class="registar row" style="width: 530px;">
                           
                                <div class="col-md-10 pl-1">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email</label>
                                        <input id="tb_email" runat="server" type="email" class="form-control" placeholder="" />
                                    </div>
                                </div>
                                <div class="col-md-5 px-1">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input id="tb_user" runat="server" type="text" class="form-control" placeholder="" value="" />
                                    </div>
                                </div>
                                <div class="col-md-5 px-1">
                                    <div class="form-group">
                                        <label>Senha</label>
                                        <input id="tb_pw" runat="server" type="text" class="form-control" placeholder="" value="" />
                                    </div>
                                </div>
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Nome</label>
                                        <input id="tb_nome" runat="server" type="text" class="form-control" placeholder="" value="" />
                                    </div>
                                </div>
                                <div class="col-md-5 pl-1">
                                    <div class="form-group">
                                        <label>Apelido</label>
                                        <input id="tb_apelido" runat="server" type="text" class="form-control" placeholder="" value="" />
                                    </div>
                                </div>
                                 
                                <div class="col-md-4 pl-1 mb-4">
                                    <div class="form-group">
                                        <asp:Label ID="lbl_mensagem" runat="server" type="text" Text="Label Mensagem">sadasd</asp:Label>
                                    </div>
                                    
                                </div>
                                  <asp:Button class="btn btn-primary" ID="btn_registar" runat="server" Text="Registar" OnClick="btn_registar_Click" />
                            </div>
                            <%-- <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Morada</label>
                                                        <input id="tb_morada" runat="server" type="text" class="form-control" placeholder="" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 pr-1">
                                                    <div class="form-group">
                                                        <label>Cidade</label>
                                                        <input id="tb_cidade" runat="server" type="text" class="form-control" placeholder="" value=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 px-1">
                                                    <div class="form-group">
                                                        <label>País</label>
                                                        <input id="tb_pais" runat="server" type="text" class="form-control" placeholder="" value=""/>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 pl-1">
                                                    <div class="form-group">
                                                        <label>Código Postal</label>
                                                        <input  id="tb_codpostal" runat="server" type="number" class="form-control" placeholder=""/>
                                                    </div>
                                                </div>
                            --%>
                        </div>
                    </div>
                </main>

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-left">
                                <p class="mb-0">
                                    <a href="https://localhost:44399/principal.aspx" class="text-muted"><strong>Roteirização</strong></a> &copy;
                                </p>
                            </div>
                            <div class="col-6 text-right">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Suporte</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Centro de Ajuda</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Privacidade</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Termos</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </form>
    <script src="assets/js/vendor.js"></script>
    <script src="assets/js/app.js"></script>
</body>
</html>
