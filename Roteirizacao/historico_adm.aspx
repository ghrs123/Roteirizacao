<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="historico_adm.aspx.cs" Inherits="Roteirizacao.historico_adm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Histórico | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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
                            <a class="sidebar-link" href="https://localhost:44399/principal_adm.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/perfil_adm.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="https://localhost:44399/historico_adm.aspx">
                                <i class="align-middle" data-feather="book"></i><span class="align-middle">Histórico</span>
                            </a>
                        </li>
                         <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/config_adm.aspx">
                                <i class="align-middle" data-feather="settings"></i><span class="align-middle">Configuração</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                               <i class="align-middle" data-feather="log-out"></i><asp:Button class="align-middle" ID="btn_sair" runat="server" Text="Sair" OnClick="btn_sair_Click" />
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
                            <input type="hidden" class="form-control" placeholder="" aria-label="Search"/>
                        </div>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">


                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>
                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                                    <!--<img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="Charles Hall" /> -->
                                    <span class="text-dark">Charles Hall</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="https://localhost:44399/perfil_adm.aspx"><i class="align-middle mr-1" data-feather="user"></i>Perfil</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="https://localhost:44399/config_adm.aspx"><i class="align-middle mr-1" data-feather="settings"></i>Configuração</a>
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
                        <h1 class="h3 mb-3">Administração</h1>
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
                                                            <li class="nav-item">
                                                                <a class="nav-link" href="#danny" role="tab" data-toggle="tab">Utilizadores</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" href="#agumbe" role="tab" data-toggle="tab">Dashboard</a>
                                                            </li>

                                                        </ul>

                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade show active" id="peter">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                                    </div>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <!--<th style="width:5%;"></th>-->
                                                                                <th style="width: 15.83%;">Origem</th>
                                                                                <th style="width: 15.83%">Destino</th>
                                                                                <th style="width: 15.83%">Data</th>
                                                                                <th style="width: 15.83%">Distância (Km)</th>
                                                                                <th style="width: 10%">Custo €</th>
                                                                                <th style="width: 25.83%">Matrícula do Veículo</th>
                                                                                <th>Editar</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <!--<td>
																			<label class="form-check">
																				<input class="form-check-input" type="checkbox" value="">
																			</label>
																		</td>-->
                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <td>315</td>
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="">

                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <td>315</td>
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <td>315</td>
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="">

                                                                                <td>Lisboa</td>
                                                                                <td>Porto</td>
                                                                                <td class="d-none d-md-table-cell">20-05-2019</td>
                                                                                <td>315</td>
                                                                                <td>60</td>
                                                                                <td>FH-65-GJ</td>
                                                                                <td class="table-action">
                                                                                    <a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
                                                                                    <a href="#"><i class="align-middle" data-feather="trash"></i></a>
                                                                                </td>
                                                                            </tr>

                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                            </div>

                                                            <div role="tabpanel" class="tab-pane fade" id="danny">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                                    </div>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 5.11%;">Id</th>
                                                                                <th style="width: 11.11%">Nome</th>
                                                                                <th style="width: 11.11%">Apelido</th>
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

        <script>
            $(function () {
                // Line chart
                new Chart(document.getElementById("chartjs-line"), {
                    type: "line",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                            label: "Custo ($)",
                            fill: true,
                            backgroundColor: "transparent",
                            borderColor: window.theme.primary,
                            data: [2115, 1562, 1584, 1892, 1487, 2223, 2966, 2448, 2905, 6000, 2917, 3327]
                        }, {
                            label: "Utilizadores",
                            fill: true,
                            backgroundColor: "transparent",
                            borderColor: "#adb5bd",
                            borderDash: [4, 4],
                            data: [958, 724, 629, 883, 915, 1214, 1476, 1212, 1554, 2128, 1466, 1827]
                        }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        tooltips: {
                            intersect: false
                        },
                        hover: {
                            intersect: true
                        },
                        plugins: {
                            filler: {
                                propagate: false
                            }
                        },
                        scales: {
                            xAxes: [{
                                reverse: true,
                                gridLines: {
                                    color: "rgba(0,0,0,0.05)"
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    stepSize: 500
                                },
                                display: true,
                                borderDash: [5, 5],
                                gridLines: {
                                    color: "rgba(0,0,0,0)",
                                    fontColor: "#fff"
                                }
                            }]
                        }
                    }
                });
            });
        </script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>


        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>

    </form>
</body>
</html>
