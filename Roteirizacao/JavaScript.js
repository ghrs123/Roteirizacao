

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


       

    });
           


            var address = document.getElementsByClassName('dest');

            for (var i = 0; i < address.length;i++) {
                 new google.maps.places.Autocomplete(address[i], options)

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



            var data = {$origin, routes, trucks};

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

                //if(t<=2){ //LIMITADO À TRES CAMINHÕES SOMENTE
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

            $("#send").click(function (e) {


        loadMap();

                onclick = $('#cover-spin').show(0);

                $("#resultado").text('');


                getFormData(function (res) {
                    if (res) {


                        var origin = res.$origin;
                        var routes = res.routes;
                        var trucks = res.trucks;

                        var data = {origin, routes, trucks};

                        data = JSON.stringify(data);

                        alert(data);

                        $.post('/calc', {data: data }, function (result) {

                            //onclick="$('#cover-spin').show(0)"

                            /*envio
                            {"origin":"almada-portugal","routes":[{"pickup":"braga-portugal","destination":"lisboa-portugal","products":[{"name":"banana","qty":"1200"}]}],"trucks":[{"id":"3/4","capacity":"6000","cost":"62"}]}
                            */

                            if (result) {


                               console.log("Server responded with ", result);

                                //str = str.replace(/^"(.*)"$/, '$1');

                                $("#resultado").text(JSON.stringify(result.routesByVehicles));

                                $("#rtime").text("Tempo de resolução (s):" + JSON.stringify(result.tempoResolucao));
                                $("#zmin").text("Custo mínimo de Transporte (R$) : " + new Intl.NumberFormat("de-DE").format(result.z));
                                //$("#zmin").text("Custo mínimo de Transporte (R$) : " + JSON.stringify(Number(result.z)));

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
                            else
                                console.log("no response");

                        });



                    }

                    else
                        console.log("não foi possível calcular");

                });



            });


        });


