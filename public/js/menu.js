$('#dropdown-menu').click(function() {
  var display = $('#menu').css('display');

  if (display === 'block') {
    $('#menu').css('display', 'none');
    $('#map-canvas').removeClass('col-md-10').addClass('col-md-12');
  } else {
    $('#menu').css('display', 'block');
    $('#map-canvas').removeClass('col-md-12').addClass('col-md-10');
  }
});

$('.settings-toggler').click(function() {
  toggleVisibility($('#settings'));
  toggleVisibility($('#overlay'));
});

$('#navbar-profile').click(function() {
  toggleVisibility($('#profile'));
  toggleVisibility($('#map-canvas'))
});

$('#menu-map').click(function() {
  hideAll();
  toggleVisibility($('#map-canvas'));
});


// Hides all the elements in the elements array
function hideAll() {
  elements = ['#settings', '#overlay', '#profile', '#map-canvas'];

  for (i = 0; i < elements.length; i++) {
    hideElement($(elements[i]));
  }
}

// Hides the element
function hideElement(element) {
  element.css('display', 'none')
}

// Toggles visibility
function toggleVisibility(element) {
  var display = element.css('display');
  var new_state = display == 'block' ? 'none' : 'block';

  element.css('display', new_state);
}

// Submits data to server without redirecting
$('#settings-submit').click(function(e) {
  var data = {
    'current-password': $('#current-password').val(),
    'new-password': $('#new-password').val(),
    'confirm-password': $('#new-password').val(),
    'current-email': $('#current-email').val(),
    'new-email': $('#new-email').val(),
    'color': $('#color').val(),
    'zoom-level': $('#zoom-level').val()
  } 

  $.post('/settings', data); 
  e.preventDefault();
  toggleSettings();
});
