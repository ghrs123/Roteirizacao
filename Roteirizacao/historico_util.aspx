<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="historico_util.aspx.cs" Inherits="Roteirizacao.historico_util" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <link href="assets/css/app.css" rel="stylesheet" />

    <title>Histórico | Roteirização</title>
    <link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="index.html">
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

                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/perfil_utilizador.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item active">
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
                                <i class="align-middle" data-feather="log-out"></i>
                                <asp:Button class="align-middle" ID="btn_sair" runat="server" Text="Sair" Style="width: 40px;" OnClick="btn_sair_Click1" />
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

                <main class="content">
                    <div class="container-fluid p-0">

                        <h1 class="h3 mb-3">Registos</h1>

                        <div class="row">

                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-center ">

                                        <div class="col-12 col-xl-10 ">
                                            <div class="panel panel-default">

                                                <!-- /.panel-heading -->
                                                <div class="row row-content">
                                                    <div class="hirtorico">

                                                        <ul class="nav nav-tabs">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" href="#peter" role="tab" data-toggle="tab">
                                                                    <h5 class="card-title">Histórico de Viagens</h5>
                                                                </a>
                                                            </li>
                                                            <!--<li class="nav-item">
													  <a class="nav-link" href="#danny" role="tab" data-toggle="tab">Utilizadores</a>
													</li>
													<li class="nav-item">
													  <a class="nav-link" href="#agumbe" role="tab" data-toggle="tab">Dashboard</a>
													</li>-->

                                                        </ul>

                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade show active" id="peter">

                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                    SelectCommand="SELECT historico_viagem.historicoid ,produto.descricao, quantidade, origem,localcoleta, localentrega,[data] 'data', custo, matricula
                                                                        FROM historico_viagem 
                                                                        JOIN carregar ON carregar.historicoid = historico_viagem.historicoid
                                                                        JOIN produto ON carregar.produtoid = produto.produtoid
                                                                        JOIN camiao ON carregar.camiaoid = camiao.camiaoid
                                                                        JOIN utilizador ON utilizador.utilizadorid = camiao.utilizadorid
                                                                        JOIN rota ON rota.historicoid = historico_viagem.historicoid
                                                                        WHERE username = @util">

                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="util" SessionField="util" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>

                                                                <div class="card container">
                                                                    <div class="card-header">
                                                                        <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                                    </div>
                                                                    <asp:Panel ID="Panel1" runat="server">
                                                                        <table class="table">
                                                                            <thead>
                                                                                <tr>
                                                                                   <%-- <th align="center"></th>--%>
                                                                                    <th align="center">Id</th>
                                                                                    <th align="center">Produto</th>
                                                                                    <th align="center">Quantidade Kg</th>
                                                                                    <th align="center">Origem</th>
                                                                                    <th align="center">Local Coleta</th>
                                                                                    <th align="center">Local de entrega</th>
                                                                                    <th align="center">Data</th>
                                                                                    <!--<th style="width:15.83%">Distância (Km)</th>-->
                                                                                    <th align="center">Custo €</th>
                                                                                    <th align="center">Matrícula do Veículo</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                                <asp:Repeater runat="server" ID="rptViagem" OnItemCommand="rptViagem_ItemCommand">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td align="center">
                                                                                                <%--<asp:Label ID="lblHistoricoId" runat="server" Text='<%# Eval("historicoid") %>'></asp:Label>--%>
                                                                                                 <%# DataBinder.Eval(Container.DataItem, "historicoid") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("descricao") %>'></asp:Label></td>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "descricao") %>
                                                                                                </td>
                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblQuantidade" runat="server" Text='<%# Eval("quantidade") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "quantidade") %>
                                                                                            </td>

                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblOrigem" runat="server" Text='<%# Eval("origem") %>'></asp:Label>--%>
                                                                                                 <%# DataBinder.Eval(Container.DataItem, "origem") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblLocalColeta" runat="server" Text='<%# Eval("localcoleta") %>'></asp:Label>--%>
                                                                                                 <%# DataBinder.Eval(Container.DataItem, "localcoleta") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <%--<asp:Label ID="lblLocalEntrega" runat="server" Text='<%# Eval("localentrega") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "localentrega") %>
                                                                                            </td>
                                                                                              
                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblData" runat="server" Text='<%# Eval("data") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "data") %>
                                                                                            </td>
                                                                                                 
                                                                                            <td align="center">
                                                                                               <%-- <asp:Label ID="lblCusto" runat="server" Text='<%# Eval("custo") %>'></asp:Label>--%>
                                                                                                 <%# DataBinder.Eval(Container.DataItem, "custo") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <%--<asp:Label ID="lblMatricula" runat="server" Text='<%# Eval("matricula") %>'></asp:Label>--%>
                                                                                                   <%# DataBinder.Eval(Container.DataItem, "matricula") %>
                                                                                            </td>
                                                                                             
                                                                                            </tr>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate> 
                                                                                   </FooterTemplate>
                                                                                </asp:Repeater>
                                                                            </tbody>
                                                                        </table>

                                                                    </asp:Panel>
                                                                    <div class="btn_salvar col-md-3">
                                                                           <asp:Button ID="btnPdf" runat="server" class="btn btn-primary" Text="Salvar em PDF" OnClick="btnPdf_Click" />
                                                                      </div>
                                                                </div>

                                                               
                                                            </div>

                                                            <div role="tabpanel" class="tab-pane fade" id="danny">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <h7 class="card-subtitle text-muted">Informações sobre Produtos</h7>
                                                                    </div>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 5.11%;">Id</th>
                                                                                <th style="width: 11.11%">Nome</th>
                                                                                <th style="width: 11.11%">Peso</th>
                                                                                <th style="width: 11.11%">E-mail</th>
                                                                                <th style="width: 11.11%">País</th>
                                                                                <th style="width: 11.11%">Cidade</th>
                                                                                <th style="width: 11.11%">Código-Postal</th>
                                                                                <th style="width: 11.11%">Morada</th>
                                                                                <th>Editar</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>Carlos</td>
                                                                                <td>Gomes</td>
                                                                                <td>carlos@mail.com</td>
                                                                                <td>Portugal</td>
                                                                                <td>Sintra</td>
                                                                                <td>2369-632</td>
                                                                                <td>Rua A</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="">
                                                                                <td>2</td>
                                                                                <td>Carlos</td>
                                                                                <td>Gomes</td>
                                                                                <td>carlos@mail.com</td>
                                                                                <td>Portugal</td>
                                                                                <td>Sintra</td>
                                                                                <td>2369-632</td>
                                                                                <td>Rua A</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>Carlos</td>
                                                                                <td>Gomes</td>
                                                                                <td>carlos@mail.com</td>
                                                                                <td>Portugal</td>
                                                                                <td>Sintra</td>
                                                                                <td>2369-632</td>
                                                                                <td>Rua A</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>

                                                                        </tbody>
                                                                    </table>

                                                                </div>

                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="agumbe">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <h6 class="card-subtitle text-muted">Painel Mensal de Custos e Utilizadores </h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <div class="chart">
                                                                            <canvas id="chartjs-line"></canvas>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.panel-body -->
                                            </div>
                                        </div>
                                        <div class="card-body">
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
