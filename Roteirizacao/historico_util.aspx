<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="historico_util.aspx.cs" Inherits="Roteirizacao.historico_util" %>

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

                        <h1 class="h3 mb-3">Registos</h1>

                        <div class="row">

                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-center ">

                                        <div class="col-12 col-xl-10 ">
                                            <div class="panel panel-default">

                                                <!-- /.panel-heading -->
                                                <div class="row row-content">
                                                    <div class="col-12">

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

                                                                <asp:Repeater runat="server" ID="rptViagem">

                                                                    <HeaderTemplate>
                                                                        <div class="card">
                                                                            <div class="card-header">
                                                                                <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                                            </div>
                                                                            <table class="table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th style="width: 5%;"></th>
                                                                                        <th style="width: 5%;">Id</th>
                                                                                        <th style="width: 12%">Produto</th>
                                                                                        <th style="width: 10%">Quantidade Kg</th>
                                                                                        <th style="width: 8%;">Origem</th>
                                                                                         <th style="width: 10%">Local Coleta</th>
                                                                                        <th style="width: 10%">Local de entrega</th>
                                                                                        <th style="width: 8%">Data</th>
                                                                                        <!--<th style="width:15.83%">Distância (Km)</th>-->
                                                                                        <th style="width: 6%">Custo €</th>
                                                                                        <th style="width: 13%">Matrícula do Veículo</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td>
                                                                                <label class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" value="" />
                                                                                </label>
                                                                            </td>
                                                                            <td><%# Eval("historicoid") %></td>
                                                                            <td><%# Eval("descricao") %></td>
                                                                            <td><%# Eval("quantidade") %></td>
                                                                            <td><%# Eval("origem") %></td>
                                                                            <td><%# Eval("localcoleta") %></td>
                                                                            <td><%# Eval("localentrega") %></td>
                                                                            <td"><td><%# Eval("data") %></td></td>
                                                                            <!--<td>315</td>-->
                                                                            <td><%# Eval("custo") %></td>
                                                                            <td><%# Eval("matricula") %></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>


                                                                <%-- <tr class="">
                                                                                <td>
                                                                                    <label class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" />
                                                                                    </label>
                                                                                </td>
                                                                                <td>2</td>
                                                                                <td>Pera</td>
                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <!--<td>315</td>-->
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <label class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" />
                                                                                    </label>
                                                                                </td>
                                                                                <td>3</td>
                                                                                <td>Uva</td>
                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <!--<td>315</td>-->
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                            </tr>
                                                                            <tr class="">
                                                                                <td>
                                                                                    <label class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" />
                                                                                    </label>
                                                                                </td>
                                                                                <td>4</td>
                                                                                <td>Maça</td>
                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <!--<td>315</td>-->
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                            </tr>--%>

                                                                <div class="btn_salvar col-md-3">
                                                                    <button type="submit" class="btn btn-primary">Salvar em PDF</button>
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
