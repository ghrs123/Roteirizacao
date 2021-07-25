<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recuperar_senha.aspx.cs" Inherits="Roteirizacao.recuperar_senha" %>

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
                         <li>
                            <a class="sidebar-link" href="https://localhost:44399/principal.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/login.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Login</span>
                            </a>
                        </li>
                       
                        <li>
                            <a class="sidebar-link" href="#">
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
                    <div class="form-inline d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                            <input type="hidden" class="form-control"  aria-label="Search" />
                        </div>
                    </div>
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
                    
                                        <div class="form">
                                            <div class="row">
                                                <!--<div class="col-md-5 pr-1">
													 <div class="form-group">
														<label>Companhia (disabled)</label>
														<input type="text" class="form-control" disabled="" placeholder="Company" value="Creative Code Inc.">
													  </div>
													  
													</div>-->
                                              
                                                <div class="col-md-7 m-a-auto p-3 email" >
                                                    <div class="form-group " >
                                                        <label for="exampleInputEmail1" style="color: #363636; font-size: 25px;"><strong>Email</strong></label>
                                                        <input id="tb_email" runat="server" type="email" class="form-control" placeholder=""/>
                                                       <div class="col-7">
                                                           <asp:Button ID="btn_recuperar" runat="server" Text="Recuperar" OnClick="btn_recuperar_Click"/>
                                                           
														</div> 
                                                        <div class=""  style="font-size: 15px; display: block;">
                                                            <asp:Label ID="lblMensagem" runat="server"   Text=""></asp:Label>                                            
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
                                    <a href="https://localhost:44399/index.aspx" class="text-muted"><strong>Roteirização</strong></a> &copy;
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
