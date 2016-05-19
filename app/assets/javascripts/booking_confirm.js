$(document).on('ready page:load', function(){
  // $('#booking_button').on('click', function(e){
    $('#new_booking').on('submit', function(e){


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



});
