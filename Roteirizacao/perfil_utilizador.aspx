﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil_utilizador.aspx.cs" Inherits="Roteirizacao.perfil_utilizador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Perfil | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="https://localhost:44399/index.aspx">
                        <span class="align-middle">Roteirização</span>
                    </a>
                    <ul class="sidebar-nav">
                        <li class="sidebar-header">Paginas
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="https://localhost:44399/principal_user.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/perfil_utilizador.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/historico_util.aspx">
                                <i class="align-middle" data-feather="book"></i><span class="align-middle">Histórico</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/config_utilizador.aspx">
                                <i class="align-middle" data-feather="settings"></i><span class="align-middle">Configuração</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                               <i class="align-middle" data-feather="log-out"></i> <asp:Button class="align-middle"   ID="btn_sair" runat="server" Text="Sair" OnClick="btn_sair_Click" />
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

                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                                    <!-- <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="Charles Hall" />-->
                                    <span class="text-dark">Christina Mason</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="https://localhost:44399/perfil_utilizador.aspx"><i class="align-middle mr-1"></i>Perfil</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="https://localhost:44399/historico_util.aspx"><i class="align-middle mr-1"></i>Histórico</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="https://localhost:44399/config_utilizador.aspx"><i class="align-middle mr-1"></i>Configuração</a>
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-item" style="text-align: center;">
                                        <asp:LinkButton Font-Underline="false" ForeColor="#6E7B8B" cass="btn align-middle" ID="btn_log" runat="server" OnClick="btn_log_Click" PostBackUrl="~/principal.aspx">Sair</asp:LinkButton>

                                    </div>

                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="content">
                    <div class="container-fluid p-0">
                        <!--<h1 class="h3 mb-3">Profile</h1>-->
                        <div class="row">
                            <!-- Coluna da esquerda-->
                            <div class="col-md-2 col-xl-2">
                                <div class="card mb-3">
                                </div>
                            </div>
                            <!-- Fim Coluna da esquerda-->

                            <div class="col-md-10 col-xl-10">
                                <div class="card">
                                    <div class="card-header">
                                        <h1 class="card-title mb-0">Perfil</h1>
                                    </div>
                                    <div class="card-body h-100">

                                        <hr />

                                        <!-- Conteudo perfil -->

                                        <div class="content">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="cardd">

                                                        <div class="card-body">
                                                            <div class="form">
                                                                <div class="row">
                                                                    <div class="col-md-5 px-1">
                                                                        <div class="form-group">
                                                                            <label>Username</label>
                                                                            <input id="tb_user" runat="server" type="text" class="form-control" placeholder="" value="chris123" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-7 pl-1">
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Email</label>
                                                                            <input id="tb_email" runat="server" type="email" class="form-control" placeholder="christinamason@mail.com" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6 pr-1">
                                                                        <div class="form-group">
                                                                            <label>Nome</label>
                                                                            <input id="tb_nome" runat="server" type="text" class="form-control" placeholder="" value="Christina" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6 pl-1">
                                                                        <div class="form-group">
                                                                            <label>Apelido</label>
                                                                            <input id="tb_apelido" runat="server" type="text" class="form-control" placeholder="" value="Mason" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Morada</label>
                                                                            <input id="tb_morada" runat="server" type="text" class="form-control" placeholder="" value="Rua x, nº, Ap." />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-4 pr-1">
                                                                        <div class="form-group">
                                                                            <label>Cidade</label>
                                                                            <input id="tb_cidade" runat="server" type="text" class="form-control" placeholder="" value="Lisboa" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 px-1">
                                                                        <div class="form-group">
                                                                            <label>País</label>
                                                                            <input id="tb_pais" runat="server" type="text" class="form-control" placeholder="" value="Portugal" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 pl-1">
                                                                        <div class="form-group">
                                                                            <label>Código Postal</label>
                                                                            <input id="tb_codpostal" runat="server" type="number" class="form-control" placeholder="2300-269" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card card-user">

                                                        <div class="card-body">

                                                            <div class="card-header">
                                                                <h5 class="card-title mb-0">Minha Foto</h5>
                                                            </div>
                                                            <div class="card-body text-center">
                                                                <asp:Image ID="Image1" runat="server"  class="img-fluid rounded-circle mb-2" width="128" height="128"/>
<%--                                                                <img src="img/avatars/avatar-4.jpg" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128" />--%>
                                                                <h5 class="card-title mb-0"><label id="lbl_nome" runat="server">Christina Mason</label></h5>

                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="button-container pb-6">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Fim  Conteudo perfil -->

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </main>

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-left">
                                <p class="mb-0">
                                    <a href="index.html" class="text-muted"><strong>Roteirização</strong></a> &copy;
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

        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>

    </form>
</body>
</html>
