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
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">início</span>
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <h1 class="h3 mb-3">Administração</h1>
                    <div class="card">
                        <div class="panel panel-default">
                            <div class="row-content">
                                <div class="coluna ">
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
                                            <a class="nav-link" href="#camiao" role="tab" data-toggle="tab">Camiões</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#agumbe" role="tab" data-toggle="tab">Gráficos</a>
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
                                                          INNER JOIN coleta ON coleta.rotaid = rota.rotaid
	                                                      ORDER BY 'data' DESC"></asp:SqlDataSource>
                                            <div class="card container ">
                                                <div class="card-header">
                                                    <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                </div>
                                                <div class="card-body">

                                                    <asp:Panel ID="Panel1" runat="server">
                                                        <table class="table" style="width: 100%;">
                                                            <thead>
                                                                <tr>
                                                                    <th align="center" class="auto-style1">Id</th>
                                                                    <th align="center" class="auto-style1">Produto</th>
                                                                    <th align="center" class="auto-style1">Peso Kg</th>
                                                                    <th align="center" class="auto-style1">Origem</th>
                                                                    <th align="center" class="auto-style1">Local de Recolha</th>
                                                                    <th align="center" class="auto-style1">Local de entrega</th>
                                                                    <th align="center" class="auto-style1">Data</th>
                                                                    <!--<th style="width:15.83%">Distância (Km)</th>-->
                                                                    <th align="center" class="auto-style1">Custo por Km</th>
                                                                    <th align="center" class="auto-style1">Matrícula do Veículo</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater runat="server" ID="rptViagem" OnItemCommand="rptViagem_ItemCommand" OnItemDataBound="rptViagem_ItemDataBound" DataSourceID="SqlDataSource1">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="lbl_historidoid" runat="server" Text='' Style="width: 5%;"></asp:Label>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Label ID="tb_descricao" runat="server" Text='' Style="width: 100px;"></asp:Label>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Label ID="tb_peso_carga" runat="server" Text='' Style="width: 100%;"></asp:Label>
                                                                            </td>
                                                                            <td align="center"><%-- <asp:Label ID="lblOrigem" runat="server" Text='<%# Eval("origem") %>'></asp:Label>--%>
                                                                                <asp:Label ID="tb_origem" runat="server" Text='' Style="width: 100%;"></asp:Label>
                                                                                <%--  <asp:TextBox ID="tb_origem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "origem") %>' style="width: 100%;"></asp:TextBox>--%>
                                                                            </td>
                                                                            <td align="center"><%-- <asp:Label ID="lblLocalColeta" runat="server" Text='<%# Eval("localcoleta") %>'></asp:Label>--%>
                                                                                <asp:Label ID="tb_localColeta" runat="server" Text='' Style="width: 100%;"></asp:Label>
                                                                                <%-- <%# DataBinder.Eval(Container.DataItem, "localColeta") %>--%>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Label ID="tb_localEntrega" runat="server" Text='' Style="width: 100%;"></asp:Label>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Label ID="tb_data" runat="server" Text='' Style="width: 100%;"></asp:Label>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Label ID="tb_custoKm" runat="server" Text='' Style="width: 100%"></asp:Label>
                                                                                <%--<%# DataBinder.Eval(Container.DataItem, "custoKm") %>--%>
                                                                            </td>
                                                                            <td align="center"><%--<asp:Label ID="lblMatricula" runat="server" Text='<%# Eval("matricula") %>'></asp:Label>--%>
                                                                                <asp:Label ID="tb_matricula" runat="server" Text='' Style="width: 100%"></asp:Label>
                                                                            </td>

                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>
                                                    </asp:Panel>
                                                    <div class="btn_salvar col-md-3">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="danny">
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                SelectCommand="SELECT utilizador.utilizadorid, utilizador.nome, utilizador.apelido, utilizador.username, utilizador.email, dados_utilizador.pais, dados_utilizador.cidade, dados_utilizador.morada, dados_utilizador.cod_postal 
                                                        FROM utilizador 
                                                        INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid 
                                                        ORDER BY utilizadorid;
                                                        "
                                                ProviderName="<%$ ConnectionStrings:roteirizaçãoConnectionString.ProviderName %>"></asp:SqlDataSource>

                                            <div class="card container">
                                                <div class="card-header">
                                                    <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                </div>
                                                <div class="card-body">
                                                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                                                    <asp:Panel ID="Panel2" runat="server">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th align="center" class="auto-style1">Id</th>
                                                                    <th align="center" class="auto-style1">Nome</th>
                                                                    <th align="center" class="auto-style1">Apelido</th>
                                                                    <th align="center" class="auto-style1">Utilizador</th>
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
                                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                <ContentTemplate>
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
                                                                                        <asp:TextBox ID="tb_username" runat="server" Text='' Style="width: 100px;"></asp:TextBox>
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
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                            <td class="table-action" style="float: left; display: inline;">
                                                                                <asp:Button ID="btnEdit" runat="server" class="align-middle btn btn-warning mb-2" Text="Editar" CommandName="btnEdit" Style="width: 100%;" />
                                                                                <asp:Button ID="btnDelete" runat="server" class="align-middle btn btn-danger " Text="Excluir" CommandName="btnDelete" Style="width: 100%;" />
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
                                        <div role="tabpanel" class="tab-pane fade" id="camiao">
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                SelectCommand=" SELECT camiaoid,descricao, matricula,quilometragem,capacidade,custoKm,nome, apelido   
	                                                   FROM camiao 
	                                                   INNER JOIN tipo_camiao ON tipo_camiao.tipo_camiaoid = camiao.tipocamiaoid
	                                                   INNER JOIN utilizador ON utilizador.utilizadorid = camiao.utilizadorid
	                                                   ORDER BY camiaoid "></asp:SqlDataSource>

                                            <div class="card container">
                                                <div class="card-header">
                                                    <h7 class="card-subtitle text-muted">Gestao de Camiões</h7>
                                                </div>
                                                <div class="card-body">
                                                    <divc class="container">
                                                        <div class="row">
                                                            <div class="col-4 d-flex mr-3">
                                                                <table class="ml-2">
                                                                    <thead>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <h1 style="background-color: #696969; color: white; width: 315px; font-size: 20px; padding-left: 40px;"><strong>Adicionar Tipo de Camião</strong></h1>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Descrição</th>
                                                                            <th>Adicionar</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="margin-right: 10px;">
                                                                                <asp:TextBox runat="server" ID="tb_tipoCamiao"></asp:TextBox>
                                                                            </td>

                                                                            <td>
                                                                                <asp:Button ID="btnAddtipo" runat="server" class="align-middle btn btn-warning mb-2" Text="Adicionar" OnClick="btnAddtipo_Click" Style="width: 100%;" />
                                                                            </td>

                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 mt-3" style="margin: 0 auto;">
                                                                    <h1 style="background-color: #696969; color: white; width: 315px; font-size: 20px; padding-left: 70px; display: block;"><strong>Adicionar Camião</strong></h1>
                                                                    <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>
                                                                    <div class="col6 d-flex">

                                                                        <table class="table camiao">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th align="center" class="auto-style1" style="width: 5%;">Matrícula</th>
                                                                                    <th align="center" class="auto-style1" style="width: 11%;">Quilometragem</th>
                                                                                    <th align="center" class="auto-style1" style="width: 11%;">Custo por Km</th>
                                                                                    <th align="center" class="auto-style1" style="width: 11%;">Capacidade</th>
                                                                                    <th align="center" class="auto-style1" style="width: 11%;">Tipo de Camião</th>
                                                                                    <th align="center" class="auto-style1" style="width: 11%;">Motorista</th>
                                                                                    <th align="center" class="auto-style1" style="width: 8%;">Opção</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>                                                                                    
                                                                                            <td align="center">
                                                                                                <asp:TextBox runat="server" ID="tbMatricula" Width="80%"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <asp:TextBox runat="server" ID="tbKm" type="number" min="0" Width="80%"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <asp:TextBox runat="server" ID="tbCusto" type="number" min="0" Width="80%"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <asp:TextBox runat="server" ID="tbCap" type="number" min="0" Width="80%"></asp:TextBox>
                                                                                            </td>                                                                                     
                                                                                    <td align="center">

                                                                                        <asp:DropDownList ID="ddlTipocC" runat="server" DataSourceID="SqlDataSource9" DataTextField="descricao" DataValueField="tipo_camiaoid" Width="80%"></asp:DropDownList>
                                                                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                                            SelectCommand="SELECT * FROM [tipo_camiao]"></asp:SqlDataSource>
                                                                                    </td>
                                                                                    <td align="center">
                                                                                        <asp:DropDownList ID="ddlMoto" runat="server" DataSourceID="SqlDataSource8" DataTextField="nome" DataValueField="utilizadorid" Width="80%"></asp:DropDownList>
                                                                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                                            SelectCommand="SELECT utilizadorid, CONCAT('Id:',CONCAT(utilizadorid +' ',' '+CONCAT( nome+' ',apelido))) as 'nome' FROM [utilizador]"></asp:SqlDataSource>
                                                                                    </td>
                                                                                    <td align="center">
                                                                                        <asp:Button ID="btnAddC" runat="server" class="align-middle btn btn-warning mb-2" Text="Adicionar" OnClick="btnAddC_Click1" Width="80%" />
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </div>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th align="center" class="auto-style1" style="width: 3%;">Id</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Tipo de Camião</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Matrícula</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Quilometros</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Custo por Km</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Capacidade</th>
                                                            <th align="center" class="auto-style1" style="width: 10%;">Motorista</th>
                                                            <th align="center" class="auto-style1" style="width: 8%;">Opções</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="RptCamiao" runat="server" OnItemCommand="RptCamiao_ItemCommand" OnItemDataBound="RptCamiao_ItemDataBound" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>


                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblIdCamiao" runat="server" Text=''></asp:Label>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:DropDownList ID="ddlTipoCamiao" runat="server" DataSourceID="SqlDataSource6" DataTextField="descricao" DataValueField="tipo_camiaoid" AutoPostBack="False" Width="85%"></asp:DropDownList>
                                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                            SelectCommand="SELECT * FROM [tipo_camiao]"></asp:SqlDataSource>

                                                                    </td>
                                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                        <ContentTemplate>
                                                                            <td align="center">
                                                                                <asp:TextBox ID="tb_matric" runat="server" Text='' Width="80%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:TextBox ID="tb_quilometro" runat="server" type="number" min="0" Text='' Width="80%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:TextBox ID="tb_custKm" runat="server" type="number" min="0" Text='' Width="80%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:TextBox ID="tb_capacidade" runat="server" Text='' Width="80%"></asp:TextBox>
                                                                            </td>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    <td align="center">

                                                                        <asp:DropDownList ID="ddlMotorista" runat="server" DataSourceID="SqlDataSource7" DataTextField="nome" DataValueField="utilizadorid" AutoPostBack="False" Width="100%"></asp:DropDownList>

                                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                            SelectCommand="SELECT utilizadorid, CONCAT('Id:',CONCAT(utilizadorid +' ',' '+CONCAT( nome+' ',apelido))) as 'nome' FROM [utilizador]"></asp:SqlDataSource>
                                                                    </td>
                                                                    <td class="table-action" style="float: left; display: inline;">

                                                                        <asp:Button ID="btnEditC" runat="server" class="align-middle btn btn-warning mb-2" Text="Editar" CommandName="btnEditC" Width="100%" />
                                                                        <asp:Button ID="btnDeleteC" runat="server" class="align-middle btn btn-danger " Text="Excluir" CommandName="btnDeleteC" Width="100%" />
                                                                    </td>

                                                                </tr>


                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
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
                                                            <asp:ChartArea Name="ChartArea1" BorderWidth="0">
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
                                                    </asp:Chart>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>" SelectCommand="SELECT DATEPART(MONTH, historico_viagem.data_viagem) AS 'Mês', SUM(camiao.custoKm) AS 'Custo Total' FROM historico_viagem INNER JOIN camiao ON camiao.camiaoid = historico_viagem.camiaoid GROUP BY DATEPART(MONTH, historico_viagem.data_viagem)"></asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>" SelectCommand="select  COUNT(quilometragem) 'quilometragem', descricao
                                                                from camiao
                                                                INNER JOIN tipo_camiao ON tipo_camiao.tipo_camiaoid = camiao.tipocamiaoid
                                                                WHERE quilometragem &gt; 10000
                                                                GROUP BY  descricao"></asp:SqlDataSource>
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
        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>

        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>
    </form>
</body>
</html>
