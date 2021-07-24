<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="historico_adm.aspx.cs" Inherits="Roteirizacao.historico_adm" EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Histórico | Roteirização</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <link href="assets/css/app.css" rel="stylesheet" />
    <script src="assets/js/cnv.js"></script>
    <link href="estilo.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            height: 41px;
        }
    </style>

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
                            <a class="sidebar-link " href="https://localhost:44399/historico_adm.aspx">
                                <i class="align-middle " data-feather="book"></i><span class="align-middle">Histórico</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/config_adm.aspx">
                                <i class="align-middle" data-feather="settings"></i><span class="align-middle">Configuração</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#">
                                <i class="align-middle" data-feather="log-out"></i>
                                <asp:Button class="align-middle" ID="btn_sair" runat="server" Text="Sair" Style="width: 40px;" OnClick="btn_sair_Click" />
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
                                    <a class="dropdown-item" href="https://localhost:44399/perfil_adm.aspx"><i class="align-middle mr-1"></i>Perfil</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="https://localhost:44399/historico_adm.aspx"><i class="align-middle mr-1"></i>Histórico</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="https://localhost:44399/config_adm.aspx"><i class="align-middle mr-1"></i>Configuração</a>
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
                    <h1 class="h3 mb-3">Administração</h1>
                    <div class="card">
                        <div class="panel panel-default">

                            <!-- /.panel-heading -->
                            <%--  <div class="row-content">
                                            <div class="coluna "> --%>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                        SelectCommand=" SELECT historico_viagem.historicoid, produto.descricao, carregar.peso_carga, rota.origem, coleta.localColeta, entrega.localEntrega, CONVERT (char(10), historico_viagem.data_viagem, 103) AS 'data', CAST(CONVERT (DECIMAL(10 , 2), camiao.custoKm) AS nvarchar) AS custoKm, camiao.matricula 
                                                            FROM historico_viagem 
                                                            INNER JOIN camiao ON historico_viagem.camiaoid = camiao.camiaoid 
                                                            INNER JOIN carregar ON carregar.camiaoid = camiao.camiaoid 
                                                            INNER JOIN produto ON produto.produtoid = carregar.produtoid 
                                                            INNER JOIN rota ON rota.rotaid = carregar.rotaid 
                                                            INNER JOIN entrega ON entrega.rotaid = rota.rotaid 
                                                            INNER JOIN coleta ON coleta.rotaid = rota.rotaid"></asp:SqlDataSource>
                                    <div class="card container ">
                                        <div class="card-header">
                                            <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                        </div>
                                        <div class="card-body">

                                            <asp:Panel ID="Panel1" runat="server">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th align="center" class="auto-style1">Id</th>
                                                            <th align="center" class="auto-style1">Produto</th>
                                                            <th align="center" class="auto-style1">Peso Kg</th>
                                                            <th align="center" class="auto-style1">Origem</th>
                                                            <th align="center" class="auto-style1">Local de Coleta</th>
                                                            <th align="center" class="auto-style1">Local de entrega</th>
                                                            <th align="center" class="auto-style1">Data</th>
                                                            <!--<th style="width:15.83%">Distância (Km)</th>-->
                                                            <th align="center" class="auto-style1">Custo por Km</th>
                                                            <th align="center" class="auto-style1">Matrícula do Veículo</th>
                                                            <th class="auto-style1">Opções</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater runat="server" ID="rptViagem" OnItemCommand="rptViagem_ItemCommand" OnItemDataBound="rptViagem_ItemDataBound" DataSourceID="SqlDataSource1">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td align="center">
                                                                        <%--  <asp:Label ID="lblHistoricoId" runat="server" Text='<%# Eval("historicoid") %>'></asp:Label>--%>
                                                                        <asp:Label ID="lbl_historidoid" runat="server" Text='' Style="width: 5%;"></asp:Label>

                                                                    </td>
                                                                    <td align="center">
                                                                        <%-- <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("descricao") %>'></asp:Label></td>--%>
                                                                        <asp:TextBox ID="tb_descricao" runat="server" Text='' Style="width: 100px;"></asp:TextBox>

                                                                        <%--<asp:TextBox ID="tb_descricao" runat="server" Text='' style="width: 100%;"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%-- <asp:Label ID="lblQuantidade" runat="server" Text='<%# Eval("quantidade") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_peso_carga" runat="server" Text='' Style="width: 100%;"></asp:TextBox>

                                                                        <%-- <asp:TextBox ID="tb_peso_carga" runat="server" Text='' style="width: 100%;"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%-- <asp:Label ID="lblOrigem" runat="server" Text='<%# Eval("origem") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_origem" runat="server" Text='' Style="width: 100%;"></asp:TextBox>

                                                                        <%--  <asp:TextBox ID="tb_origem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "origem") %>' style="width: 100%;"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%--  <asp:TextBox ID="tb_localColeta" runat="server" Text='' style="width: 100%;"></asp:TextBox>--%>
                                                                        <%-- <asp:Label ID="lblLocalColeta" runat="server" Text='<%# Eval("localcoleta") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_localColeta" runat="server" Text='' Style="width: 100%;"></asp:TextBox>

                                                                    </td>
                                                                    <td align="center">
                                                                        <%--<asp:Label ID="lblLocalEntrega" runat="server" Text='<%# Eval("localentrega") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_localEntrega" runat="server" Text='' Style="width: 100%;"></asp:TextBox>

                                                                        <%--  <asp:TextBox ID="tb_localEntrega" runat="server" Text='' style="width: 100%;"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%-- <asp:Label ID="lblData" runat="server" Text='<%# Eval("data") %>'></asp:Label>--%>

                                                                        <asp:TextBox ID="tb_data" runat="server" Text='' Style="width: 100%;"></asp:TextBox>

                                                                        <%--   <asp:TextBox ID="TextBox2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "data") %>' style="width: 100%;"></asp:TextBox>--%>
                                                                        <%--  <asp:TextBox ID="tb_data" runat="server" Text='' style="width: 100%;"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%-- <asp:Label ID="lblCusto" runat="server" Text='<%# Eval("custo") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_custoKm" runat="server" Text='' Style="width: 100%"></asp:TextBox>

                                                                        <%--<asp:TextBox ID="tb_custokm" runat="server" Text='' style="width: 100%"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <%--<asp:Label ID="lblMatricula" runat="server" Text='<%# Eval("matricula") %>'></asp:Label>--%>
                                                                        <asp:TextBox ID="tb_matricula" runat="server" Text='' Style="width: 100%"></asp:TextBox>
                                                                        <%-- <asp:TextBox ID="tb_matricula" runat="server" Text='' style="width: 100%"></asp:TextBox>--%>
                                                                    </td>
                                                                    <td class="table-action" style="float: left; display: inline;">

                                                                        <asp:Button ID="btnEdit" runat="server" class="align-middle btn btn-warning " Text="Editar" CommandName="btnEdit" Style="width: 65%;" />
                                                                        <asp:Button ID="btnDelete" runat="server" class="align-middle btn btn-danger " Text="Excluir" CommandName="btnDelete" Style="width: 65%;" />
                                                                        <%--  <asp:Button Id="btnUpdate" runat="server" class="align-middle" data-feather="trash" OnClick="btnUpdate_Click"/>--%>
                                                                        <%-- <a href="#"><i class="align-middle" ></i></a>
                                                                                                <a href="#"><i class="align-middle" data-feather="trash"></i></a>--%>
                                                                    </td>
                                                                </tr>

                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </asp:Panel>
                                            <div class="btn_salvar col-md-3">
                                                <%--  <asp:Button ID="btnPdf" runat="server" class="btn btn-primary" Text="Salvar em PDF" OnClick="btnPdf_Click" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="danny">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                        SelectCommand="SELECT utilizador.utilizadorid, utilizador.nome, utilizador.apelido, utilizador.email, dados_utilizador.pais, dados_utilizador.cidade, dados_utilizador.morada, dados_utilizador.cod_postal 
                                                        FROM utilizador 
                                                        INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid 
                                                        "></asp:SqlDataSource>

                                    <div class="card container">
                                        <div class="card-header">
                                            <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                        </div>
                                        <div class="card-body">
                                            <asp:Panel ID="Panel2" runat="server">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th align="center" class="auto-style1">Id</th>
                                                            <th align="center" class="auto-style1">Nome</th>
                                                            <th align="center" class="auto-style1">Apelido</th>
                                                            <th align="center" class="auto-style1">E-mail</th>
                                                            <th align="center" class="auto-style1">País</th>
                                                            <th align="center" class="auto-style1">Cidade</th>
                                                            <th align="center" class="auto-style1">Código-Postal</th>
                                                            <th align="center" class="auto-style1">Morada</th>
                                                            <th align="center" class="auto-style1">Opção</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="rptUtilizador" runat="server" OnItemCommand="rptUtilizador_ItemCommand" OnItemDataBound="rptUtilizador_ItemDataBound" DataSourceID="SqlDataSource2">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Label ID="lbl_id" runat="server" Text=' style="width: 5%;"'></asp:Label>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="tb_nome" runat="server" Text='' Style="width: 100px;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="tb_apelido" runat="server" Text='' Style="width: 100%;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="tb_email" runat="server" Text='' Style="width: 100%;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="tb_pais" runat="server" Text='' Style="width: 100%;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">

                                                                        <asp:TextBox ID="tb_cidade" runat="server" Text='' Style="width: 100%;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="tb_cod_postal" runat="server" Text='' Style="width: 100%;"></asp:TextBox>
                                                                    </td>
                                                                    <td align="center">

                                                                        <asp:TextBox ID="tb_morada" runat="server" Text='' Style="width: 100%"></asp:TextBox>
                                                                    </td>
                                                                    <td class="table-action" style="float: left; display: inline;">
                                                                        <asp:Button ID="btnEdit" runat="server" class="align-middle btn btn-warning " Text="Editar" CommandName="btnEdit" Style="width: 65%;" />
                                                                        <asp:Button ID="btnDelete" runat="server" class="align-middle btn btn-danger " Text="Excluir" CommandName="btnDelete" Style="width: 65%;" />
                                                                    </td>
                                                                </tr>

                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="agumbe">
                                    <div class="card container">
                                        <div class="card-header">
                                            <h6 class="card-subtitle text-muted">Painel Mensal de Custos e Utilizadores </h6>
                                        </div>
                                        <div class="card-body">
                                        
                                            <asp:Chart ID="Chart1" runat="server" Width="600px" Height="500px" BackGradientStyle="LeftRight" DataSourceID="SqlDataSource3">
                                                <Titles>
                                                    <asp:Title ShadowOffset="3" Name="Items" Text="Custos Mensais" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                        LegendStyle="Row" />
                                                </Legends>
                                                <Series>
                                                    <asp:Series ChartArea="ChartArea1" IsXValueIndexed="True" Legend="Default" Name="Series1" XValueMember="Mês" YValueMembers="Custo Total">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BorderWidth="0" >
                                                        <AxisY Title="Custo Total">
                                                        </AxisY>
                                                        <AxisX Title="Meses">
                                                        </AxisX>
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>

                                            <asp:Chart ID="Chart2" runat="server" Width="400px" Height="400px" BackGradientStyle="LeftRight" DataSourceID="SqlDataSource4">
                                                <Series>
                                                    <asp:Series Name="Camião Eixo Sestavado" XValueMember="descricao" XValueType="Single" YValueMembers="quilometragem" IsValueShownAsLabel="True"></asp:Series>
                                                    <asp:Series ChartArea="ChartArea1" Name="Camião Truck" ChartType="Pie">
                                                    </asp:Series>
                                                    <asp:Series ChartArea="ChartArea1" Name="Carreta Simples " ChartType="Pie">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Name="Title1" Text="Controle de Manutenção (10000)">
                                                    </asp:Title>
                                                </Titles>
                                                <BorderSkin SkinStyle="Raised" />
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>" SelectCommand="SELECT DATEPART(MONTH, historico_viagem.data_viagem) AS 'Mês', SUM(camiao.custoKm) AS 'Custo Total' FROM historico_viagem INNER JOIN camiao ON camiao.camiaoid = historico_viagem.camiaoid GROUP BY DATEPART(MONTH, historico_viagem.data_viagem)"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>" SelectCommand="select  COUNT(quilometragem) 'quilometragem', descricao
from camiao
INNER JOIN tipo_camiao ON tipo_camiao.tipo_camiaoid = camiao.tipocamiaoid
WHERE quilometragem &gt; 50000
GROUP BY  descricao"></asp:SqlDataSource>
                                        </div>

                                    </div>
                                    </div>
                                </div>
                            </div>

                            <%--   </div>
                                        </div>--%>
                            <!-- /.panel-body -->
                        </div>
                    </div>
                </main>
            </div>
        </div>
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

      

        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>

        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>
    </form>
</body>
</html>
