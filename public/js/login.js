function scrollToElement(element, time) {
  if (typeof(time) === 'undefined') {time = 1000}

  var pos = $(element).offset().top;
  $('body, html').animate({scrollTop: pos}, time);
}

$('#register-button').click(function() {
  toggleVisibility($('#register-rectangle'));
  scrollToElement($('#register-rectangle'), 300);
});

// 1 is the ratio of which the image should follow (1 = 100 of movement)
// Reduce the amount by 70px to make sure there is not a white space between navbar and image

var yPos, image;
function parallax() {
  yPos = window.pageYOffset;
  image = document.getElementById('header-image');
  image.style.top = yPos * 1 - 70 + 'px';
}

window.addEventListener('scroll', parallax);