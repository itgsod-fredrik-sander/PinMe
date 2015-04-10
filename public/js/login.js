function scrollToElement(element, time, offset) {
  if (typeof(time) === 'undefined') {time = 1000}
  if (typeof(offset) === 'undefined') {offset = 0}

  var pos = $(element).offset().top;
  $('body, html').animate({scrollTop: pos + offset}, time);
}

$('#register-button').click(function() {
  toggleVisibility($('#register-rectangle'));
  scrollToElement($('#features'), 300, -50);
});

// 1 is the ratio of which the image should follow (1 = 100 of movement)
// Reduce the amount by 70px to make sure there is not a white space between navbar and image

var yPos, image;
function parallax() {
  yPos = window.pageYOffset;
  image = document.getElementById('header-image');
  image.style.top = yPos * 1 - 70 + 'px';
}

enquire.register("screen and (max-width:768px)", {
  match : function () {
    window.removeEventListener('scroll', parallax);
    document.getElementById('header-image').style.top = '0px';
  },

  unmatch : function() {
    window.addEventListener('scroll', parallax);
  }
});