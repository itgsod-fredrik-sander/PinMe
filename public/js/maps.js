function initialize() {

  var mapOptions = {
      zoom: 3,
      minZoom: 3,
      center: { lat: -34.397, lng: 150.644},
      disableDefaultUI: true,
      zoomControl: true
  }
      
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  line(map);

  map.set('styles', [
      {
          "featureType": "administrative",
          "elementType": "labels.text.fill",
          "stylers": [
              {
                  "color": "#444444"
              }
          ]
      },
      {
          "featureType": "landscape",
          "elementType": "all",
          "stylers": [
              {
                  "color": "#f2f2f2"
              }
          ]
      },
      {
          "featureType": "poi",
          "elementType": "all",
          "stylers": [
              {
                  "visibility": "off"
              }
          ]
      },
      {
          "featureType": "road",
          "elementType": "all",
          "stylers": [
              {
                  "saturation": -100
              },
              {
                  "lightness": 45
              }
          ]
      },
      {
          "featureType": "road.highway",
          "elementType": "all",
          "stylers": [
              {
                  "visibility": "simplified"
              }
          ]
      },
      {
          "featureType": "road.arterial",
          "elementType": "labels.icon",
          "stylers": [
              {
                  "visibility": "off"
              }
          ]
      },
      {
          "featureType": "transit",
          "elementType": "all",
          "stylers": [
              {
                  "visibility": "off"
              }
          ]
      },
      {
          "featureType": "water",
          "elementType": "all",
          "stylers": [
              {
                  "color": "#46bcec"
              },
              {
                  "visibility": "on"
              }
          ]
      }
  ]);

  var pins = []
  $('#search-tour').click(function(e) {

    $.ajax({
        url: '/tourdata',
        data: 'id=' + $('#id').val(),
        context: document.body,
        success: function(res) {
          clearPins(pins);
          var data = $.parseJSON(res);

          $.each(data, function(i, item) {
            pins.push(createMarker(item, map));
            map.panTo(pins[0].position);
          });
        }
      })

      e.preventDefault();
  });

}

function line(map) {
  poly = new google.maps.Polyline({ map: map });
  clickedPoints = []
  google.maps.event.addListener(map, "click", function(evt) {
    /* Debugging the class type of evt and seeing if you can create near identical objects.
       Next, save the clicked points into the database and then draw the route between the clicked points on tour load */
    clickedPoints.push(evt.latLng);
    console.log(new google.maps.LatLng(evt.latLng.k, evt.latLng.D));
    // D = Longitude
    console.log(evt.latLng.D);
    // K = Latitude
    console.log(evt.latLng.k);
    console.log(clickedPoints);
    if (shiftPressed || path.getLength() === 0) {
      path.push(evt.latLng);
    if(path.getLength() === 1) {
      poly.setPath(path);
    }
      } else {
        service.route({ origin: path.getAt(path.getLength() - 1), destination: evt.latLng, travelMode: google.maps.DirectionsTravelMode.DRIVING }, function(result, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            for(var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
              path.push(result.routes[0].overview_path[i]);
            }
          }
        });
      }
  });
}

function createMarker(item, map) {
  var pos = new google.maps.LatLng(item.latitude, item.longitude);
  var marker = new google.maps.Marker({
      position: pos,
      map: map,
      title: 'test'
  });

  var contentString = buildContentString(item);
  var infowindow = new google.maps.InfoWindow;
  infowindow.setContent(contentString);

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
    map.panTo(marker.position);
  });

  return marker;
}

function buildContentString(item) {
  return '<div id="content">' + '<h1 id="firstHeading" class="firstHeading"> ' + item.title + '</h1>' +
  '<div id="bodyContent">'+
  '<p>' + item.description + '</p>'+
  '</div>'+
  '</div>';
} 

function clearPins(pins) {
  for (i in pins) {
      pins[i].setMap(null);
  }

  pins.length = 0;
}

google.maps.event.addDomListener(window, 'load', initialize);
var map, path = new google.maps.MVCArray(), service = new google.maps.DirectionsService(), shiftPressed = false, poly;
google.maps.event.addDomListener(document, "keydown", function(e) { shiftPressed = e.shiftKey; });
google.maps.event.addDomListener(document, "keyup", function(e) { shiftPressed = e.shiftKey; });
