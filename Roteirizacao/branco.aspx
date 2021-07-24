﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="branco.aspx.cs" Inherits="Roteirizacao.branco" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
        th {
            font-weight:bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <input type="button" onclick="CreateTableFromJSON()" value="Create Table From JSON" />
        <p id="showData"></p>

    </form>
     <script>
         function CreateTableFromJSON() {
             var simulation = [
                 {
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
                 },
                 {
                     "veiculo": "truck",
                     "rotas": [
                         "aveiro-portugal",
                         "lisboa-portugal",
                         "sintra-portugal",
                         "aveiro-portugal"
                     ],
                     "cargas": []
                 }
             ];

             window.console.log(simulation);

             for (let i = 0; i < simulation.length; i++) {
                 var veiculo = simulation[i].veiculo;
                 var rotas = simulation[i].rotas;
                 var cargas = simulation[i].cargas;

                 window.console.log("veiculo: " + veiculo);
                 window.console.log("rotas: " + rotas);
                 window.console.log("cargas: " + cargas);


                 //imprime rotas
                 for (let j = 0; j < rotas.length; j++) {
                     console.log(rotas[j]);
                 }

                 //imprime cargas
                 for (let j = 0; j < cargas.length; j++) {
                     console.log(cargas[j].Carga);
                     console.log(cargas[j].qty);
                 }
             }


         }


             //for (var i = 0; i < simulation.length; i++) {

             //    for (var key in simulation[i]) {

             //        if (col.indexOf(key) === -1) {
             //            col.push(key);

             //        }

             //    }
             //}

             // CREATE DYNAMIC TABLE.
             var table = document.createElement("table");

             // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

             var tr = table.insertRow(-1);                   // TABLE ROW.

             for (var i = 0; i < col.length; i++) {
                 var th = document.createElement("th");      // TABLE HEADER.
                 th.innerHTML = col[i];
                 tr.appendChild(th);
             }

             // ADD JSON DATA TO THE TABLE AS ROWS.
             for (var i = 0; i < simulation.length; i++) {

                 tr = table.insertRow(-1);

                 for (var j = 0; j < col.length; j++) {
                     var tabCell = tr.insertCell(-1);
                     tabCell.innerHTML = simulation[i][col[j]];
                 }
             }

             // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
             var divContainer = document.getElementById("showData");
             divContainer.innerHTML = "";
             divContainer.appendChild(table);
         }
     </script>
</body>
</html>
 