function scrollToElement(element, time) {
  if (typeof(time) === 'undefined') {time = 1000}

  var pos = $(element).offset().top;
  $('body, html').animate({scrollTop: pos}, time);
}

$('#register-button').click(function() {
  toggleVisibility($('#register-rectangle'));
  scrollToElement($('#register-rectangle'), 300);
});