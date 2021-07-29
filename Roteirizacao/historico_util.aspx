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
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Início</span>
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

                <main class="content fundo">
                    <div class="container-fluid p-0">

                        <h1 class="h3 mb-3">Registos</h1>

                        <div class="row">

                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-center ">

                                        <div class="col-12 col-xl-10 ">
                                            <div class="panel panel-default">

                                                <!-- /.panel-heading -->
                                                <div class="row-content">
                                                    <div class="coluna">

                                                        <ul class="nav nav-tabs">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" href="#peter" role="tab" data-toggle="tab">
                                                                    <h5 class="card-title">Histórico de Viagens</h5>
                                                                </a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" href="#camiao" role="tab" data-toggle="tab">Meu Camião</a>
                                                            </li>
                                                            <%-- <li class="nav-item">
                                                                <a class="nav-link" href="#agumbe" role="tab" data-toggle="tab">Dashboard</a>
                                                            </li>--%>
                                                        </ul>

                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade show active" id="peter">

                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"></asp:SqlDataSource>

                                                                <div class="card container">
                                                                    <div class="card-header">
                                                                        <h7 class="card-subtitle text-muted">Informações sobre as rotas</h7>
                                                                    </div>
                                                                    <asp:Panel ID="Panel1" runat="server">
                                                                        <table class="table" style="width: 100%;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <%-- <th align="center"></th>--%>
                                                                                    <th align="center">Id</th>
                                                                                    <th align="center">Produto</th>
                                                                                    <th align="center">Peso Kg</th>
                                                                                    <th align="center">Origem</th>
                                                                                    <th align="center">Local Recolha</th>
                                                                                    <th align="center">Local de Entrega</th>
                                                                                    <th align="center">Data</th>
                                                                                    <!--<th style="width:15.83%">Distância (Km)</th>-->
                                                                                    <th align="center">Custo por Km</th>
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
                                                                                                <%# DataBinder.Eval(Container.DataItem, "peso_carga") %>
                                                                                            </td>

                                                                                            <td align="center">
                                                                                                <%-- <asp:Label ID="lblOrigem" runat="server" Text='<%# Eval("origem") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "origem") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <%-- <asp:Label ID="lblLocalColeta" runat="server" Text='<%# Eval("localcoleta") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "localColeta") %>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <%--<asp:Label ID="lblLocalEntrega" runat="server" Text='<%# Eval("localentrega") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "localEntrega") %>
                                                                                            </td>

                                                                                            <td align="center">
                                                                                                <%-- <asp:Label ID="lblData" runat="server" Text='<%# Eval("data") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "data") %>
                                                                                            </td>

                                                                                            <td align="center">
                                                                                                <%-- <asp:Label ID="lblCusto" runat="server" Text='<%# Eval("custo") %>'></asp:Label>--%>
                                                                                                <%# DataBinder.Eval(Container.DataItem, "custoKm") %>
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
                                                            <div role="tabpanel" class="tab-pane fade" id="camiao">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <h6 class="card-subtitle text-muted">Informações do Camiao</h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                            SelectCommand=" SELECT camiaoid,descricao, matricula,quilometragem,capacidade,Cast(CONVERT(DECIMAL(10,2),custoKm) as nvarchar) AS custoKm,nome, apelido   
	                                                                           FROM camiao 
	                                                                           INNER JOIN tipo_camiao ON tipo_camiao.tipo_camiaoid = camiao.tipocamiaoid
	                                                                           INNER JOIN utilizador ON utilizador.utilizadorid = camiao.utilizadorid
                                                                               WHERE username = @util
	                                                                           ORDER BY camiaoid  
                                                                            ">

                                                                            <SelectParameters>
                                                                                <asp:SessionParameter Name="util" SessionField="util" Type="String" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                            <ContentTemplate>
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
                                                                                                            <asp:Button ID="btnAddC" runat="server" class="align-middle btn btn-warning mb-2" Text="Adicionar" OnClick="btnAddC_Click" Width="80%" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <asp:Panel ID="Panel2" runat="server">
                                                                                    <table class="table">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th align="center" class="auto-style1" style="width: 5%;">Id</th>
                                                                                                <th align="center" class="auto-style1" style="width: 10%;">Tipo de Camião</th>
                                                                                                <th align="center" class="auto-style1" style="width: 10%;">Matrícula</th>
                                                                                                <th align="center" class="auto-style1" style="width: 10%;">Quilometros</th>
                                                                                                <th align="center" class="auto-style1" style="width: 10%;">Custo por Km</th>
                                                                                                <th align="center" class="auto-style1" style="width: 10%;">Capacidade</th>
                                                                                                <th align="center" class="auto-style1" style="width: 8%;">Opções</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <%--  <asp:Repeater ID="RptCamiao" runat="server" OnItemCommand="RptCamiao_ItemCommand" OnItemDataBound="RptCamiao_ItemDataBound" DataSourceID="SqlDataSource5">--%>
                                                                                            <asp:DataList ID="dtlCamiao" runat="server" DataSourceID="SqlDataSource5" OnItemDataBound="dtlCamiao_ItemDataBound" OnItemCommand="dtlCamiao_ItemCommand" Width="100%">
                                                                                                <ItemTemplate>
                                                                                                    <tr>
                                                                                                         <td>
                                                                                                            <asp:Label ID="lblIdCamiao" runat="server" Text='' Width="80%"></asp:Label>
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
                                                                                                        <td class="table-action" style="float: left; display: inline;">
                                                                                                            <asp:Button ID="btnEditC" runat="server" class="align-middle btn btn-warning mb-2" Text="Editar" CommandName="btnEditC" Width="100%" />
                                                                                                            <asp:Button ID="btnDeleteC" runat="server" class="align-middle btn btn-danger " Text="Excluir" CommandName="btnDeleteC" Width="100%" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </asp:Panel>

                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                        <asp:Label runat="server" ID="lblMsg"></asp:Label>

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
