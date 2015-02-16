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

$('#settingbutton').click(function() {
  toggleSettings();
});

$('#closesetting').click(function() {
  toggleSettings();
});

function toggleSettings() {
  var visibility = $('#settings').css('visibility');
  var new_state = visibility == 'visible' ? 'hidden' : 'visible';

  $('#overlay').css('visibility', new_state)
  $('#settings').css('visibility', new_state);
}