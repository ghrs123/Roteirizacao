<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabela.aspx.cs" Inherits="Roteirizacao.tabela" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DataList ID="dlRota" runat="server" RepeatLayout="Table" RepeatColumns="3"
            CellPadding="2" CellSpacing="2">
            <ItemTemplate>
                <table class="table table-bordered table-hover table-condensed">
                    <thead>
                        <tr>
                            <th title="Field #1">Veiculos</th>
                            <th title="Field #2">Rotas</th>
                            <th title="Field #6">Cargas</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>34</td>
                            <td>Veiculos: <%# Eval("veiculo") %>l</td>
                            <td>Rotas: <%# Eval("rotas") %></td>
                            <td>cargas: <%# Eval("cargas") %></td>
                            <td align="right">123</td>
                        </tr>
                       
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:DataList>

    </form>

   <script type="text/javascript">
       $(function () {
           $("[id*=dlCustomers]").hide();
           $.ajax({
               type: "POST",
               url: "Default.aspx/GetCustomers",
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: OnSuccess,
               failure: function (response) {
                   alert(response.d);
               },
               error: function (response) {
                   alert(response.d);
               }
           });
       });

       function OnSuccess(response) {
           var xmlDoc = $.parseXML(response.d);
           var xml = $(xmlDoc);
           var customers = xml.find("Table");
           var repeatColumns = parseInt("<%=dlCustomers.RepeatColumns == 0 ? 1 : dlCustomers.RepeatColumns %>");
           var rowCount = Math.ceil(customers.length / repeatColumns);
           var i = 0;
           while (i < repeatColumns * rowCount) {
               var row = $("[id*=dlCustomers] tr").eq(0).clone(true);
               for (var j = 0; j < repeatColumns; j++) {
                   var customer = $(customers[i]);
                   if (customer.length == 0) {
                       $("table:last", row).remove();
                   } else {
                       $(".veiculo", row).eq(j).html(customer.find("veiculo").text());
                       $(".rotas", row).eq(j).html(customer.find("rotas").text());
                       $(".cargas", row).eq(j).html(customer.find("cargas").text());
                    
                   i++;
               }
               $("[id*=dlCustomers]").append(row);
           }
           $("[id*=dlCustomers] tr").eq(0).remove();
           $("[id*=dlCustomers]").show();
       }
   </script>
</body>
</html>
