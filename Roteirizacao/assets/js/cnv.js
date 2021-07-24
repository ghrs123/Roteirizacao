	
		var markers = [];

		var loadMap = function() {
			directionsService = new google.maps.DirectionsService;
			directionsDisplay = new google.maps.DirectionsRenderer;

			var myOptions = {
				center: new google.maps.LatLng(38.736946, -9.140560),
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map"), myOptions);

			//  service = new google.maps.places.PlacesService(map); 

			directionsDisplay.setMap(map);

			//	var onChangeHandler = function() {
			//	calculateAndDisplayRoute(directionsService, directionsDisplay);
			//	};
			//	document.getElementById('origem').addEventListener('change', onChangeHandler);
			//	document.getElementById('destino').addEventListener('change', onChangeHandler);

			// };
			

		

		}
		window.onload = loadMap;		

		var droptolls = function(result) {

			$.each(result, function(key, data) {
				var latLng = new google.maps.LatLng(data.loc.coordinates[1],
						data.loc.coordinates[0]);
				// Creating a marker and putting it on the map
				marker = new google.maps.Marker({
					position : latLng,
					map : map,
					title : "€ " + data.properties.CustoR$,
					icon : "/images/toll-both1.png"

				});
				var tPrice = data.properties.CustoR$;

				tPrice = tPrice.toFixed(2).toString().replace(".", ",")

				marker.info = new google.maps.InfoWindow({
					content : 'Concessionária: '
							+ data.properties.Concessionária + '<br>Praça: '
							+ data.properties.Praça + '<br>Rodovia: '
							+ data.properties.Rodovia + '<br>Sentido: '
							+ data.properties.Sentido + '<br>km: '
							+ data.properties.km + '<br><b>Preço: €</b>'
							+ '<b>' + tPrice + '</b>'
				});

				markers.push(marker);

				google.maps.event.addListener(marker, 'click', function() {
					this.info.open(map, this);
				});

			});

		}

	
		
	
		

	
		
		
		