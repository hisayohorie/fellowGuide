$(document).on('ready', function(){
  $('#become_guide').on('click', function(){
    // alert("works");
    $('.become_guide_modal').fadeIn();
  });

  $('.close').on('click', function(){
    $('.become_guide_modal').fadeOut();
  })
});
