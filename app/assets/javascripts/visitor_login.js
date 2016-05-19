$(document).on('ready', function() {
  $(".visitor_login_link").on('click', function(e){
    $(".visitor_login_modal").fadeIn();
    e.preventDefault();
  });

  $(".close").on('click', function(){
    $(".visitor_login_modal").fadeOut();
  });
});
