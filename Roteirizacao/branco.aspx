<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="branco.aspx.cs" Inherits="Roteirizacao.branco" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlTipocC" runat="server" DataSourceID="SqlDataSource9" DataTextField="descricao" DataValueField="tipo_camiaoid"></asp:DropDownList>

            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource9" DataTextField="descricao" DataValueField="tipo_camiaoid"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:roteirizaçãoConnectionString %>" SelectCommand="SELECT [descricao] FROM [tipo_camiao] WHERE ([descricao] = @descricao)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTipocC" Name="descricao" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
     
            
        </div>
    </form>
</body>
</html>
