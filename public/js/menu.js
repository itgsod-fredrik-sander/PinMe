$('.settings-toggler').click(function() {
  toggleVisibility($('#settings'));
  toggleVisibility($('#overlay'));
});

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
  
  toggleVisibility($('#settings'));
  toggleVisibility($('#overlay'));
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
