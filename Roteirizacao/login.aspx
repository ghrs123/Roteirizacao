<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Roteirizacao.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Login | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/styles.css" />
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
                        <li class="sidebar-header">Paginas
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/login.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Login</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="https://localhost:44399/registar.aspx">
                                <i class="align-middle" data-feather="book-open"></i><span class="align-middle">Cadastre-se</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="https://localhost:44399/registar.aspx">
                                <i class="align-middle" data-feather="phone"></i><span class="align-middle">Contacto</span>
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

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">

                            <li class="nav-item">
                                <a class="nav-link d-none d-sm-inline-block btn btn-light align-middle" href="https://localhost:44399/registar.aspx">
                                    <span class="text-dark">Cadastre-se</span>
                                </a>
                                <a class="nav-link d-none d-sm-inline-block btn btn-light" href="#">
                                    <span class="text-dark">Contacto</span>
                                </a>
                                <a class="nav-link d-none d-sm-inline-block btn btn-light" href="https://localhost:44399/login.aspx">
                                    <span class="text-dark">Login</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="content fundo">
                    <div class="container-fluid p-0">
                        <h1 class="h3 mb-3" style="color: white;">Login</h1>
                        <div class="row">
                            <div class="col-md-8 col-sm-8">
                                <div class="cards">
                                    <div class="card">
                                        <!--Login-->
                                        <div id="container" class="login">
                                            <div class="form">
                                                <label for="tb_user">Username:</label>
                                                <input type="name" id="tb_user" runat="server" />
                                                <label for="password">Password:</label>
                                                <p><a href="https://localhost:44399/recuperar_senha.aspx">Esqueceu sua Senha?</a></p>
                                                <input type="password" id="tb_password" runat="server" />
                                                <div id="lower" style="height: 90px;">
                                                    <div class="ml-1">
                                                        <asp:Button ID="btn_login" runat="server" Text="login" OnClick="btn_login_Click" />
                                                        <asp:Button ID="btn_registar" runat="server" Text="Registar" OnClick="btn_registar_Click" />
                                                    </div>
                                                        <asp:Label ID="lbl_mensagem" runat="server" Text="" Style="display: inline-block; text-align: center; margin-left: 50px; margin-top: 1em;"></asp:Label>
                                                </div>

                                            </div>

                                        </div>
                                        <!--Fim Login-->
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
