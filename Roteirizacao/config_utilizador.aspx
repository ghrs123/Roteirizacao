﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="config_utilizador.aspx.cs" Inherits="Roteirizacao.config_utilizador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Configuração | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />
    <link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post" enctype="multipart/form-data" action="config_utilizador.aspx">
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
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/perfil_utilizador.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/historico_util.aspx">
                                <i class="align-middle" data-feather="book"></i><span class="align-middle">Histórico</span>
                            </a>
                        </li>

                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/config_utilizador.aspx">
                                <i class="align-middle" data-feather="settings"></i><span class="align-middle">Configuração</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="log-out"></i>
                                <asp:Button class="align-middle" ID="btn_sair" runat="server" style=" width: 40px;" Text="Sair" OnClick="btn_sair_Click" />
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
                                    <span class="text-dark">Menu</span>
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

                <main class="content fundo">
                    <div class="container-fluid p-0">

                        <h1 class="h3 mb-3">Configuração</h1>

                        <div class="row">
                            <div class="col-md-4 col-xl-2">

                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Meus Dados</h5>
                                    </div>

                                    <div class="list-group list-group-flush" role="tablist">
                                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account" role="tab">Conta
                                        </a>
                                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#password" role="tab">Alterar Pala-Passe
                                        </a>

                                    </div>
                                </div>

                            </div>

                            <div class="col-md-8 col-xl-10">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="account" role="tabpanel">

                                        <div class="card">
                                            <div class="card-header">

                                                <h5 class="card-title mb-0">Minhas Informações</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="form">
                                                    <div class="row">
                                                        <div class="col-md-8">

                                                            <div class="form-group">
                                                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" Width="100%">
                                                                    <ItemTemplate>
                                                                            <div class="card-body">

                                                                                <div class="form-row">

                                                                                    <div class="form-group col-md-12">
                                                                                        <label for="tb_user">Utilizador</label>
                                                                                        <asp:TextBox ID="tb_username" runat="server" class="form-control" Text='<%# Eval("username") %>'></asp:TextBox>
                                                                                    </div>

                                                                                    <div class="form-group col-md-6">
                                                                                        <label for="tb_nome">Nome</label>
                                                                                        <asp:TextBox ID="tb_nome" runat="server" class="form-control" Text='<%# Eval("nome") %>'></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="form-group col-md-6">
                                                                                        <label for="inputLastName">Apelido</label>
                                                                                    
                                                                                        <asp:TextBox ID="tb_apelido" runat="server" class="form-control" Text='<%# Eval("apelido") %>'></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputEmail4">Email</label>
                                                                                
                                                                                    <asp:TextBox ID="tb_email" runat="server" class="form-control" Text='<%# Eval("email") %>'></asp:TextBox>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="inputAddress">Morada</label>
                                                                                   
                                                                                    <asp:TextBox ID="tb_morada" runat="server" class="form-control" Text='<%# Eval("morada") %>'></asp:TextBox>
                                                                                </div>

                                                                                <div class="form-row">
                                                                                    <div class="form-group col-md-6">
                                                                                        <label for="inputCity">Cidade</label>
                                                                                        <asp:TextBox ID="tb_cidade" runat="server" class="form-control" Text='<%# Eval("cidade") %>'></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="form-group col-md-6">
                                                                                        <label for="inputCity">Pais</label>
                                                                                      
                                                                                        <asp:TextBox ID="tb_pais" runat="server" class="form-control" Text='<%# Eval("pais") %>'></asp:TextBox>
                                                                                    </div>

                                                                                    <div class="form-group col-md-2">
                                                                                        <label for="inputZip">Código Postal</label>
                                                                                     
                                                                                        <asp:TextBox ID="tb_postcod" runat="server" class="form-control" Text='<%# Eval("cod_postal") %>'></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                        </div>

                                                                        <div>
                                                                            <asp:Button ID="btn_salvardados" type="submit" Text="Salvar Alterações" runat="server" class="btn btn-primary" CommandName="btn_salvardados" ></asp:Button>

                                                                        </div>
                                                                        
                                                                      
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                    SelectCommand="SELECT * FROM utilizador INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid WHERE username = @util">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="util" SessionField="util" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                        <!-- Upload Foto-->
                                                        <div class="col-md-4">
                                                            <div class="text-center">

                                                                <asp:Image ID="Image2" runat="server" class="rounded-circle img-responsive mt-2" Width="128" Height="128" />
                                                                <div class="mt-2">
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                </div>
                                                                <small>Para melhores resultados, use uma imagem pelo menos 128px por 128px no formato . jpg</small>

                                                                <div class=" mb-5">
                                                                    <asp:Button ID="btnUpload" type="submit" Text="Alterar" runat="server" class="btn btn-primary" CommandName="update" OnClick="btnUpload_Click" Width="80px"></asp:Button>
                                                                </div>

                                                                <asp:Label ID="lbl_mensagem2" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>

                                                        <!--Fim  Upload Foto-->
                                                    </div>


                                                </div>

                                            </div>
                                        </div>



                                    </div>
                                    <div class="tab-pane fade" id="password" role="tabpanel">
                                        <div class="card  ">

                                            <div class="card-body  d-flex justify-content-center ">

                                                <div class="form ">
                                                    <div class="form-group">
                                                        <label for="tb_senhaatual">Pala-Passe Atual</label>
                                                        <asp:TextBox ID="tb_senhaatual" runat="server" type="passowrd" pattern="^(?=(.{4})*$)[A-Za-z0-9+/]*={0,2}$" class="form-control"></asp:TextBox>
                                                       
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="tb_novasenha">Nova Pala-Passe</label>
                                                        <asp:TextBox ID="tb_novasenha" runat="server" type="passowrd"  pattern="^(?=(.{4})*$)[A-Za-z0-9+/]*={0,2}$" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <!-- Verificação de senha 
												<div class="form-group">
													<label for="inputPasswordNew2">Verify password</label>
													<input type="password" class="form-control" id="inputPasswordNew2">
												</div>
												 Verificação de senha -->
                                                    <asp:Button ID="btn_salvar" class="btn btn-primary" runat="server" Text="Salvar Alterações" OnClick="btn_salvar_Click1" />
                                                    <div>
                                                        <asp:Label ID="lbl_mensagem" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
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
