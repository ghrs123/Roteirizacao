<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="principal_adm.aspx.cs" Inherits="Roteirizacao.principal_adm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roteirização </title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
    <link href="assets/css/app.css" rel="stylesheet" />
    <script src="assets/js/cnv.js"></script>
    <link href="estilo.css" rel="stylesheet" />
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-1XQsZgfFm92nBllJAJ8P4a31xYaYGs4&libraries=places,geometry&signed_in=true"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
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
                            <a class="sidebar-link" href="https://localhost:44399/principal_adm.aspx">
                                <i class="align-middle" data-feather="home"></i><span class="align-middle">Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
                            <a class="sidebar-link" href="https://localhost:44399/perfil_adm.aspx">
                                <i class="align-middle" data-feather="user"></i><span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item ">
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
                                        <asp:LinkButton Font-Underline="false" ForeColor="#6E7B8B" cass="btn align-middle" ID="btn_log" runat="server" OnClick="btn_log_Click" PostBackUrl="~/principal.aspx">Sair</asp:LinkButton></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main class="content fundo">
                    <div class="row">
                        <div class="container">
                            <!--form method="post" action="/calc"-->

                            <div class="form principal">
                                <table class="table table-bordered table-hover" cellspacing="0" id="tab_origin">
                                    <thead>
                                        <tr>
                                            <th class="text-left" colspan="4">
                                                <b>Origem</b>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="text" id="origin" name="origin" class=" form-control input-md dest" placeholder="Origem" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table table-bordered table-hover" cellspacing="0" id="tab_logic">
                                       <thead>
                                        <tr>
                                            <th class="text-center" style="display: none;">#
                                            </th>
                                            <th class="text-center">Produto
                                            </th>
                                            <th class="text-center">Demanda (kg)
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr1'>
                                            <td class="text-center" style="display: none;">1
                                            </td>
                                            <td>
                                                <input type="text" name='prod1' id='prod1' class=" form-control input-md" placeholder="Produto" />
                                            </td>
                                            <td>
                                                <input runat="server" type="number" step="1" min="1" max="5" onkeypress="return event.charCode >= 48 && event.charCode <= 57" title="Numbers only" name='qty1' id='qty1' onchange="removeChar(qty1)" class=" form-control input-md" placeholder='Demanda (kg)' />
                                            </td>
                                        </tr>
                                    </tbody>
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="display: none;">#
                                            </th>
                                            <th class="text-center">Local de Coleta
                                            </th>
                                            <th class="text-center">Local de Entrega
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='pickup1'>
                                            <td class="text-center" style="display: none;">1
                                            </td>
                                            <td>
                                                <input type="text" name='pickupplace1' id='pickupplace1' class=" form-control input-md dest" placeholder="Local de Coleta" />
                                            </td>
                                            <td>
                                                <input type="text" name='dest1' id='dest1' class="form-control input-md dest" placeholder="Local de Entrega" />
                                            </td>
                                        </tr>
                                    </tbody>
                                 
                                </table>
                                <a id="add_pickup_destination" class="btn btn-primary  pull-left">Adicionar Entrega</a>&nbsp &nbsp
			                    <a id="add_prod" class="btn btn-primary pull-center">Adicionar Produto</a>
                                <a id="delete_prod" class="btn btn-danger pull-right">Remover Produto/Entrega</a>
                                <!--<a id='delete_row' class="pull-right btn btn-default">Remover Entrega</a>-->
                                <table class="table table-bordered table-hover" cellspacing="0" width="100%" id="tab_trucks">
                                    <thead>
                                        <tr>
                                            <td class="text-left" colspan="4">
                                                <b>Veículos</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="text-center" style="display: none;">#
                                            </th>
                                            <th class="text-center">Referência do veículo</th>
                                            <th class="text-center">Capacidade (kg)</th>
                                            <th class="text-center">Custo  €/km</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='truck0'>
                                            <td style="display: none;">1</td>
                                            <td>
                                                <input type="text" id='id0' name='id' class=" form-control input-md" placeholder="Referência do veículo" />
                                            </td>
                                            <td>
                                                <input type="text" id='cap0' name='cap' class=" form-control input-md" placeholder="Capacidade (kg)" />
                                            </td>
                                            <td>
                                                <input type='number' step='1' min='1' max='5' onkeypress='return event.charCode >= 48 && event.charCode <= 57' title='Numbers only' id='cost0' name='cost' class=" form-control input-md" placeholder='Custo R$/km' />
                                            </td>
                                        </tr>
                                        <tr id='truck1'></tr>
                                    </tbody>
                                </table>

                                <a id="add_truck" class="btn btn-primary  pull-left">Adicionar Veículo</a>&nbsp												
			                    <!--input type="submit" class="btn btn-primary"-->

                                <a id='delete_truck' class="btn btn-danger pull-center ">Remover Veículo</a>
                                <a id='enviar' class="btn btn-success pull-center ">ROTEIRIZAR</a>&nbsp
				                <a id='send' class="btn btn-warning pull-center" onclick="window.location.reload();">RECOMEÇAR</a>
                                <div class="rotas">
                                    <p>Rotas por veículo</p>
                                   
                                    <div id="resultado" text="" style="background-color: chartreuse;">
                                    </div>
                                         
                                
                                   <%-- <asp:Label ID="lbl_nome" runat="server" Text=""></asp:Label>--%>
                                    <label id="lblnome2" runat="server"></label>
                        
                                    <input type="hidden" id="tb_resp" runat="server" />
                                    <div id="rtime" style="background-color: chartreuse;">
                                        <asp:Label ID="lbl_rtime" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div id="zmin" style="background-color: chartreuse;">
                                        <asp:Label ID="lbl_zmin" runat="server" Text=""></asp:Label>
                                    </div>
                                <div class="mapa" style="position: relative;">
                                    <div id="map"></div>
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

    <script src="assets/js/jquery.js"></script>
    <!--<script src="assets/js/vendor.js"></script>-->
    <script src="assets/js/app.js"></script>
    <script>

        jQuery.support.cors = true;
        function clearOverlays() {



            while (markers.length) {
                markers.pop().setMap(null);
            }
            markers.length = 0;

            markers = [];


        }

        //  $(document).ready(
        //     function() {

        function removeChar(id) {


            var a = document.getElementById("qty1").value;
            //console.log(a);
            a = a.replace(/\s+/g, "").replace(/[^\w\-]+/g, "").replace(/\-\-+/g, "").replace(/^-+/, "").replace(/-+$/, "");

            //console.log(a);
            document.getElementById("qty1").innerHTML = a;



        }



        function addressLookup() {

            var options = {
                componentRestrictions: {
                    country: 'pt'
                }
            };


            var autocomplete = new google.maps.places.Autocomplete(
                document.getElementById('origin'), options);


            var autocomplete = new google.maps.places.Autocomplete(
                document.getElementById('dest0'), options);



            google.maps.event.addListener(autocomplete, 'place_changed',
                function () {


                    // fillInAddress();

                });
            // });


            var address = document.getElementsByClassName('dest');

            for (var i = 0; i < address.length; i++) {
                new google.maps.places.Autocomplete(address[i], options);

            }


        }


        function slugify(text) {

            return text.toString().toLowerCase()
                .replace("á", "a")
                .replace("ã", "a")
                .replace("õ", "o")
                .replace("é", "e")
                .replace("í", "i")
                .replace("ó", "o")
                .replace("ú", "u")
                .replace("ç", "c")
                .replace(/\s+/g, "-").replace(
                    /[^\w\-]+/g, "").replace(/\-\-+/g, "-").replace(/^-+/, "")
                .replace(/-+$/, "");
        }


        function Product(name, qty) {
            this.name = name;
            this.qty = qty;
            // property and method definitions

        };


        function Routes(_pickup, _destination) {

            this.pickup = _pickup;
            this.destination = _destination;
            //var products = [];

            this.products = [];




            Routes.prototype.getPickup = function () {

                return this.pickup;

            }

            Routes.prototype.setPickup = function (_pickup) {

                this.pickup = _pickup;
            }

            Routes.prototype.getDestination = function () {

                return this.destination;
            }

            Routes.prototype.setDestination = function (_destination) {

                this.destination = _destination;

            }

            Routes.prototype.getProducts = function () {

                return this.products;


            }


            Routes.prototype.setProducts = function (name, qty) {



                this.products.push(new Product(name, qty));




            }


        };


        function Trucks(id, capacity, cost) {
            this.id = id;
            this.capacity = capacity;
            this.cost = cost;
            // property and method definitions

        };

        function getFormData(callback) {

            var origin = [];
            var routes = [];
            var trucks = [];
            var getPickupPlace;
            var getDestinationPlace;
            var product;
            var quantity;



            var tbl = document.getElementById("tab_logic");
            var numRows = tbl.rows.length; // get the number of rown from table tab_logic

            var tbl_trucks = document.getElementById("tab_trucks");
            var numRowsTblTrucks = tbl_trucks.rows.length; // get the number of rown from table tab_logic


            $origin = slugify($('#origin').val());


            for (var i = 1; i <= numRows; i++) {



                var checkType = $('#pickupplace' + (i)).val();



                if (typeof checkType != "undefined") {


                    getPickupPlace = slugify($('#pickupplace' + (i)).val());

                    getDestinationPlace = slugify($('#dest' + (i)).val());

                    //console.log(getPickupPlace,getDestinationPlace)

                    route = new Routes(getPickupPlace, getDestinationPlace);

                    routes.push(route);



                }

                var checkType = $('#prod' + (i)).val();

                if (typeof checkType != "undefined") {

                    product = $('#prod' + (i)).val();
                    quantity = $('#qty' + (i)).val();

                    //console.log(product,quantity);

                    route.setProducts(product, quantity);

                }



            }


            //if (routes.length==0)
            //routes.push(route);

            //console.log(routes);


            if (trucks.length < numRowsTblTrucks - 2) {


                for (var i = 1; i < numRowsTblTrucks - 2; i++) {
                    var ID = tbl_trucks.rows[i].id;
                    var cells = tbl_trucks.rows[i].getElementsByTagName('td');



                    id = $('#id' + (i - 1)).val();
                    capacidade = $('#cap' + (i - 1)).val();
                    custo = $('#cost' + (i - 1)).val();

                    var addNewItem;

                    addNewItem = new Trucks(id, capacidade, custo);

                    trucks.push(addNewItem);

                }

            }



            var data = { $origin, routes, trucks };

            callback(data);

        };


        var ndest = 2;
        var i = 1; //product counter
        var d = 1; // destination counter


        var colourArray = ['navy', 'green', 'fuchsia', 'red', 'white', 'lime', 'maroon', 'purple', 'aqua', 'black', 'grey', 'silver', 'olive', 'blue', 'yellow', 'teal'];


        $(document).ready(function () {

            addressLookup()  //bind googlemaps autocomplete to origin and destinations

            //bind googlemaps autocomplete to origin and destinations

            $("#add_pickup_destination").click(function () {

                getFormData(function (res) {
                    if (res) {

                        var routes = res.routes;

                        //if (routes.length <=3){ //soente 4 coletas e 4 entregas são permitidos
                        if (routes.length <= 100) { //soente 4 coletas e 4 entregas são permitidos

                            d++
                            i++



                            $('<thead id="thead' + (i) + '"><tr style="background-color: blue"><th   class="text-center"></th><th  class="text-center"></th><th  class="text-center"></th></tr><tr><th   class="text-center" style="display:none;">#</th><th  class="text-center">Local de Coleta</th><th  class="text-center"> Local de Entrega</th></tr> </thead>').appendTo('#tab_logic');

                            var $add_pickup_destination = $('<tr id="pickup' + (i) + '"></tr>').appendTo('#tab_logic thead:last');

                            $add_pickup_destination.click($('#pickup' + (i)).html("<td class='text-center' style='display:none;'>" + i + "</td><td><input  id='pickupplace" + i + "'  name='pickupplace" + d + "' type='text' placeholder='Local de Coleta'  class='form-control input-md dest'></td><td><input  id='dest" + i + "' name='dest" + d + "' type='text' placeholder='Local de Entrega' class='form-control input-md dest'></td>"));



                            addressLookup() //bind googlemaps autocomplete to new destinations


                        }


                    }
                });


            });




            $("#delete_row").click(function () {
                if (d > 1) {

                    /*if(){ //to do - dont delete row is there is no destination
                      $("#addr"+(i-1)).
                    }*/

                    $("#addr" + (d)).html('');
                    $("#addr" + (d)).remove();
                    $("#thead" + (d)).html('');
                    $("#thead" + (d)).remove();


                    d--;
                }


                ndest--;
            });




            ////product////////////////////

            //var i=1;
            $("#add_prod").click(function () {

                getFormData(function (res) {
                    if (res) {

                        var routes = res.routes;

                        routes = routes[routes.length - 1];


                        //if (routes.products.length <=1){ //somente 2 produtos por Entrega
                        if (routes.products.length <= 10) { //somente 2 produtos por Entrega

                            i++;

                            $('<thead id="thead' + (i) + '"><tr><th   class="text-center" style="display:none;">#</th><th  class="text-center">Produto</th><th  class="text-center">Demanda (kg)</th></tr> </thead>').appendTo('#tab_logic');

                            var $addproduct = $('<tr id="addr' + (i) + '"></tr>').appendTo('#tab_logic thead:last');

                            $addproduct.click($('#addr' + (i)).html("<td class='text-center' style='display:none;'>" + i + "</td><td><input  id='prod" + i + "'  name='prod" + d + "' type='text'   placeholder='Produto'  class='form-control input-md'></td><td><input  id='qty" + i + "' name='qty" + d + "' type='number' step='1'  min='1' max='5' onkeypress='return event.charCode >= 48 && event.charCode <= 57'  title='Numbers only'  placeholder='Demanda (kg)'  class='form-control input-md'></td>"));


                        }

                    }
                });

            });


            $("#delete_prod").click(function () {
                /*if(d>1){
                
                $("#addr"+(d)).html('');
                $( "#addr"+(d) ).remove();
                $("#thead"+(d)).html('');
                $( "#thead"+(d) ).remove();
                
                d--;
                
                }*/

                if (i > 1) {

                    $("#addr" + (i)).html('');
                    $("#addr" + (i)).remove();
                    $("#thead" + (i)).html('');
                    $("#thead" + (i)).remove();

                    i--;

                }

            });

            ////product//////////////////// 



            var t = 1;



            $("#add_truck").click(function () {


                if (t <= 100) { //LIMITADO À TRES CAMINHÕES SOMENTE
                    $('#truck' + t).html("<td style='display:none;'>" + (t + 1) + "</td><td><input id='id" + t + "' name='id' type='text' placeholder='Referência do veículo' class='form-control input-md'  /> </td><td><input  id='cap" + t + "' name='cap' type='text' placeholder='Capacidade (kg)'  class='form-control input-md'></td><td><input  id='cost" + t + "' name='cost' type='number' step='1'  min='1' max='5' onkeypress='return event.charCode >= 48 && event.charCode <= 57'  title='Numbers only' placeholder='Custo R$/km'  class='form-control input-md'></td>");

                    $('#tab_trucks').append('<tr id="truck' + (t + 1) + '"></tr>');
                    t++;

                }
            });




            $("#delete_truck").click(function () {
                if (t > 1) {
                    $("#truck" + (t - 1)).html('');
                    t--;
                }
            });

            var resp = false;
            var data2 = "";

            $("#enviar").click(function (e) {

                e.preventDefault();

                loadMap();


                onclick = $('#cover-spin').show(0);

                $("#resultado").text('');


                getFormData(function (res) {
                    if (res) {

                        //console.log("enviar", res);

                        var origin = res.$origin;
                        var routes = res.routes;
                        var trucks = res.trucks;

                        var dataa = { origin, routes, trucks };

                        data = JSON.stringify(dataa);

                        $.post('http://localhost:4120/calc', { data: data }, function (result) {

                            if (result) {

                                console.log("Server responded with ", result);
                                var data = JSON.stringify(result.routesByVehicles);

                                resp = true;
                                data2 = JSON.stringify(result.routesByVehicles);


                                var c = 0;

                                for (var veiculo in result.routesByVehicles) {
                                    var rotas = result.routesByVehicles[veiculo].rotas


                                    var waypoints = [];
                                    var start;
                                    var end;
                                    start = rotas.splice(0, 1)[0];
                                    end = rotas.splice(-1, 1)[0];

                                    for (var loc in rotas) {

                                        waypoints.push({ location: rotas[loc], stopover: true });


                                    }

                                    var request = {
                                        origin: start,
                                        destination: end,
                                        waypoints: waypoints,
                                        travelMode: google.maps.TravelMode.DRIVING
                                    };

                                    // Pass the directions request to the directions service.

                                    directionsService
                                        .route(
                                            request,
                                            function (
                                                response,
                                                status) {
                                                if (status == google.maps.DirectionsStatus.OK) {

                                                    directionsDisplay = new google.maps.DirectionsRenderer;

                                                    directionsDisplay.setMap(map);

                                                    directionsDisplay.setOptions({
                                                        preserveViewport: true,
                                                        suppressInfoWindows: false,
                                                        polylineOptions: {
                                                            strokeWeight: 4,
                                                            strokeOpacity: 0.8,
                                                            strokeColor: colourArray[c]
                                                        },

                                                    });

                                                    // Display the route on the map.
                                                    directionsDisplay
                                                        .setDirections(response);

                                                    c = c + 1;
                                                }
                                            });



                                }
                              <%--  /*<%= ResolveUrl("~/principal.aspx/GetData") %>*/--%>

                                $.post(' <%= ResolveUrl("/principal.aspx/GetData") %>', { data: data2 }, function (result) {
                                    if (result) {
                                        console.log(data2);
                                        alert(data2);
                                        alert("Post efetuado");
                                        //alert(result.d);
                                    } else {
                                        alert(error);

                                    }
                                });


                            }
                            else {
                                console.log("no response");
                            }

                        });



                    }

                    else
                        console.log("não foi possível calcular");

                });

                getFormData(function (res) {
                    if (res) {


                        //console.log("enviar", res);

                        var origin = res.$origin;
                        var routes = res.routes;
                        var trucks = res.trucks;

                        var dataa = { origin, routes, trucks };

                        data = JSON.stringify(dataa);

                        $.post('http://localhost:4120/calc', { data: data }, function (result) {

                            if (result) {

                                console.log("Server responded with ", result);
                                var data = JSON.stringify(result.routesByVehicles);

                                //$("#resultado").text(JSON.stringify(result.routesByVehicles));
                                //$("#resultado").text(data);
                                document.getElementById("lblnome2").textContent = JSON.stringify(result.routesByVehicles);

                                document.getElementById("tb_resp").value = JSON.stringify(result.routesByVehicles);
                                $("#rtime").text("Tempo de resolução (s):" + JSON.stringify(result.tempoResolucao));
                                $("#zmin").text("Custo mínimo de Transporte (€) : " + new Intl.NumberFormat("de-DE").format(result.z));
                                //$("#zmin").text("Custo mínimo de Transporte (R$) : " + JSON.stringify(Number(result.z)));

                                //resp = true;
                                //data2 = JSON.stringify(result.routesByVehicles);

                                var c = 0;

                                for (var veiculo in result.routesByVehicles) {
                                    var rotas = result.routesByVehicles[veiculo].rotas


                                    var waypoints = [];
                                    var start;
                                    var end;
                                    start = rotas.splice(0, 1)[0];
                                    end = rotas.splice(-1, 1)[0];

                                    for (var loc in rotas) {

                                        waypoints.push({ location: rotas[loc], stopover: true });


                                    }

                                    var request = {
                                        origin: start,
                                        destination: end,
                                        waypoints: waypoints,
                                        travelMode: google.maps.TravelMode.DRIVING
                                    };

                                    // Pass the directions request to the directions service.

                                    directionsService
                                        .route(
                                            request,
                                            function (
                                                response,
                                                status) {
                                                if (status == google.maps.DirectionsStatus.OK) {

                                                    directionsDisplay = new google.maps.DirectionsRenderer;

                                                    directionsDisplay.setMap(map);

                                                    directionsDisplay.setOptions({
                                                        preserveViewport: true,
                                                        suppressInfoWindows: false,
                                                        polylineOptions: {
                                                            strokeWeight: 4,
                                                            strokeOpacity: 0.8,
                                                            strokeColor: colourArray[c]
                                                        },

                                                    });

                                                    // Display the route on the map.
                                                    directionsDisplay
                                                        .setDirections(response);

                                                    c = c + 1;
                                                }
                                            });



                                }
                            }
                            else {
                                console.log("no response");
                            }

                        });

                    }

                    else
                        console.log("não foi possível calcular");

                });

            });

        });


    </script>
</body>
</html>
