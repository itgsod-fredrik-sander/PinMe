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
  toggleSettings();
});

function toggleSettings() {
  var visibility = $('#settings').css('visibility');
  var new_state = visibility == 'visible' ? 'hidden' : 'visible';

  $('#overlay').css('visibility', new_state)
  $('#settings').css('visibility', new_state);
}

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
