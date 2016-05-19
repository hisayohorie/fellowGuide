$(document).on('ready', function(){
  $('#booking_button').on('click', function(e){
    e.preventDefault();

    var bookingData = $('#new_booking').serialize();
    var guideId = $('#new_booking').attr('action');

    $.ajax({
      url: guideId,
      method: "POST",
      dataType: "script",
      data: bookingData
    });
  });

  $('.close').on('click', function(){
    #rediterect to the profile page
  });

});
