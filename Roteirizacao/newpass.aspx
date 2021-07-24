<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newpass.aspx.cs" Inherits="Roteirizacao.newpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <title>Nova Palavra-Passe | Roteirização</title>
    <link href="assets/css/app.css" rel="stylesheet" />
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
                            <a class="sidebar-link" href="https://localhost:44399/principal.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
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
                    <div class="container-fluid p-0" style="text-align: center;">
                        <h1 class="h3 mb-3">Redefinição de Palavra-Passe</h1>
                    </div>
                    <div class="col-md-6 col-xl-6" style="margin: 0 auto;">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="camiao" role="tabpanel">

                                <div class="card">
                                    <div class="card-header">

                                        <h5 class="card-title mb-0">Minhas Informações</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="form">
                                            <div class="row">
                                                <div class="col-md-8" style="margin: 0 auto; top: 0px; left: 0px;">
                                                    <div class="card-body">
                                                    </div>
                                                    <%--     
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>"
                                                                    SelectCommand="SELECT * FROM utilizador INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid WHERE username = @util">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="util" SessionField="util" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <div class="form " style="color: white;">    
                            <div class="form-group ">
                                <label for="tbNewPass">Nova Senha</label>
                                <asp:TextBox ID="tbNewPass" runat="server" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" Text="*" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="tbRepNewPass">Confirmar Nova Palavra-Passe</label>
                                <asp:TextBox ID="tbRepNewPass" runat="server" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" type="password" class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" Text="*" ControlToValidate="tbRepNewPass"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator" ControlToCompare="tbNewPass" ControlToValidate="tbRepNewPass">*</asp:CompareValidator>
                            </div>
                            <asp:Button ID="btnAlterar" class="btn btn-primary" runat="server" Text="Salvar Alterações" Onclick="btnAlterar_Click" />
                            <div>
                                <asp:Label ID="lbl_mensagem" runat="server" Text=""></asp:Label>
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
</body>
</html>
