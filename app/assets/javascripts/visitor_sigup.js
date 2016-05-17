$(document).on('ready', function() {
  $(".visitor_signup_link").on('click', function(e){
    $(".visitor_signup_modal").fadeIn();
    e.preventDefault();
  });
});
