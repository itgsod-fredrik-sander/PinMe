function initialize() {

  var mapOptions = {
      zoom: 3,
      center: { lat: -34.397, lng: 150.644},
      disableDefaultUI: true,
      zoomControl: true
  }
      
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

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
    console.log('clicked');
    $.ajax({
        url: '/tourdata',
        data: 'id=' + $('#id').val(),
        context: document.body,
        success: function(res) {
          clearPins(pins);
          var data = $.parseJSON(res);

          $.each(data, function(i, item) {
            var pos = new google.maps.LatLng(item.latitude, item.longitude);
            var marker = new google.maps.Marker({
                position: pos,
                map: map,
                title: 'test'
            });

            pins.push(marker);

            var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading"> ' + item.title + '</h1>'+
            '<div id="bodyContent">'+
            '<p>' + item.description + '</p>'+
            '<p> adsfadsfadsf adfiasdnfiu </p>' +
            '<p> asdfnasdfasndfaiusd </p>' + 
            '</div>'+
            '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            google.maps.event.addListener(marker, 'click', function() {
              infowindow.open(map,marker);
            });
          });
        }
      })

      e.preventDefault();
  });
}

function clearPins(pins) {
  for (i in pins) {
      pins[i].setMap(null);
  }

  pins.length = 0;
}

google.maps.event.addDomListener(window, 'load', initialize);
