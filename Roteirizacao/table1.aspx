<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table1.aspx.cs" Inherits="Roteirizacao.table1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <style>
button{
    border-radius: 10px;
    height: 45px;
    width: 150px;
    text-align: center;
    background-color: #5499C7;
    font-size: 15px;
    color: #ffffff;
    }
  input{
    height: 35px;
    font-size: 15px;
}
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    text-align: center;
    padding: 15px;
    font-size: 20px;
}
th {
    background-color: #5499C7;
    color: white;
    font-style: bold;
    font-size: 35px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
      <script >
//JSON Object................
          var json_obj = {
                          "veiculo": "34",
                          "rotas": [
                              "aveiro-portugal",
                              "lisboa-portugal",
                              "sintra-portugal",
                              "aveiro-portugal"
                          ],
                          "cargas": [
                              {
                                  "Carga": "asdasd",
                                  "qty": 123
                              }
                          ]
                      }
             
//JSON Object End................
//Create table and fetch data from JSON Object.
          $(document).ready(function () {
              $("button").click(function () {
                  var number_of_rows = json_obj.length;
                  var k = 0;



                  var table_body = '<table border="1" id="example" class="table table-bordered table-hover table-condensed"><thead><tr><th>Veiculo</th><th>Rotas</th><th>Cargas</th></tr></thead><tbody>';
                  for (i = 0; i < json_obj.length; i++) {
                     
                      var veiculo = simulation[i].veiculo;
                      var rotas = simulation[i].rotas;
                      var cargas = simulation[i].cargas;

                      table_body += '<tr>';
                      //td1
                          table_body += '<td>';
                          table_body += json_obj.veiculo[j];
                          table_body += '</td>';

                      //td2
                      table_body += '<td><tr>';
                              for (j = 0; j < rotas.length; j++) {
                                 // console.log(rotas[j]);
                                  table_body += '<td>';
                                  table_body += json_obj.rotas[j];
                                  table_body += '</td>';

                      }

                      table_body += '<tr></td>';

                      //td3
                      table_body += '<td><tr>';
                      for (j = 0; j < cargas.length; j++) {
                          
                            table_body += '<td>';
                              able_body += json_obj.cargas[j].Carga[i];
                            table_body += '</td>';
                              table_body += '<td>';
                                 able_body += json_obj.cargas[j].qty[i];
                              table_body += '</td>';
                 
                      }
                  
                      table_body += '</tr></td>';
                  }

                  table_body += '</tbody></table>';
                  $('#tableDiv').html(table_body);
                  //display data..........
              });
              // for search function.................................. only............................
              //$("#search").on("keyup", function () {

              //});
              var value = $(this).val().toLowerCase();
              $("table tr").filter(function (index) {
                  if (index > 0) {
                      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                  }
              });
              //=================End=========================End===============================
          });
      </script>
    <form id="form1" runat="server">
       <div style="margin-top: 50px; margin-left: 250px; margin-right: 250px;">
    <button>Create Table</button>
<input type="text" id="search" placeholder="Search data here....."></input>
    <div id="tableDiv" style="margin-top: 40px">
        Table will gentare here.
    </div>
</div>
<p id="p1"></p>

    </form>
</body>
</html>
