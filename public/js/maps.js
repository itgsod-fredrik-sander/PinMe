

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

        loadLines();
      }
    });

      e.preventDefault();
  });
}

function line(map) {
  poly = new google.maps.Polyline({ map: map, strokeColor: 'blue'});
  google.maps.event.addListener(map, "click", function(evt) {

    // Saves the clicked point to our database
    // D = Longitude
    // K = Latitude

    if (shiftPressed || path.getLength() === 0) {
      path.push(evt.latLng);
      $.post('/new/clickedpoint', {'lng': evt.latLng.D, 'lat': evt.latLng.k, 'freeMove': shiftPressed});

      if(path.getLength() === 1) {
        poly.setPath(path);
      }

    } else {
      service.route({ origin: path.getAt(path.getLength() - 1), destination: evt.latLng, travelMode: google.maps.DirectionsTravelMode.DRIVING }, function(result, status) {
        var cpStatus = false;
        if (status == google.maps.DirectionsStatus.OK) {
          cpStatus = true;
          for(var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
            path.push(result.routes[0].overview_path[i]);
          }
        }

        if (cpStatus) {
          $.post('/new/clickedpoint', {'lng': evt.latLng.D, 'lat': evt.latLng.k, 'freeMove': shiftPressed});
        }
      });
    }
  });
}

function loadLines() {
  $.get('/lines', function (res) {
    var data = $.parseJSON(res);
    loadPath(data, 0);
  });
}

function loadPath(items, current) {
  if(current == items.length)
    return;

  var item = items[current];
  var next = new google.maps.LatLng(item.latitude, item.longitude);

  if (item.free_move || path.getLength() === 0) {
    path.push(next);

    if (path.getLength() === 1) {
      poly.setPath(path);
    }
  } else {
    /* DirectionService.route is a asynchronous function. Because we don't want multiple threads modifying our path's content at the same time
      we write a recursive function to emulate a synchronous function. With this being said we wait until the path to one of the points have been
      calculated before we continue. */ 

    service.route({ origin: path.getAt(path.length - 1), destination: next, travelMode: google.maps.DirectionsTravelMode.DRIVING, provideRouteAlternatives: false }, function(result, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        for(var j = 0, len = result.routes[0].overview_path.length; j < len; j++) {
          path.push(result.routes[0].overview_path[j]);
        }

        loadPath(items, current + 1);
      }
    });
  }
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

var map, path = new google.maps.MVCArray(), service = new google.maps.DirectionsService(), shiftPressed = false, poly;
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(document, "keydown", function(e) { shiftPressed = e.shiftKey; });
google.maps.event.addDomListener(document, "keyup", function(e) { shiftPressed = e.shiftKey; })