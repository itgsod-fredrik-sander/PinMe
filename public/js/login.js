$(document).ready(function() {
  var registerRectVisible = false;
  $("#register-rectangle").hide();
  $("#create-rectangle").hide();

  $("#register-button").click(function() {
    if (!registerRectVisible)
    {
      $("#register-rectangle").fadeIn();
      $("#create-rectangle").fadeIn();
      $("#register-button").html("Hide");
      registerRectVisible = true;
    } 
    else 
    {
      $("#register-rectangle").fadeOut();
      $("#create-rectangle").fadeOut();
      $("#register-button").html("Register");
      registerRectVisible = false;
    }
  })

  $("#create-account-button").click(function() {
    $("#account-form").submit();
  })
});