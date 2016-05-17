

$(document).on('ready page:load', function(){
  $('#availabiltiy-bar > div').toggleClass("square greenSquare");
  $('#booking_date_4i').on('change', function(e){
    createAvailbiltyBar(e);
  });
  $('#booking_date_3i').on('change', function(e){
    createAvailbiltyBar(e);
  });
  $('#booking_date_2i').on('change', function(e){
    createAvailbiltyBar(e);
  });
  $('#booking_duration').on('change keyup blur mouseup',function(e){
    //multiply the bookingBoxWidht (40px) by the duration of the booking
    var newBookingBoxWitdth = 40 * parseInt($('#booking_duration').val());
    $('#bookingBox').css('width', newBookingBoxWitdth);
  });
    $('.actions input').on('click',function(){

    });
});


function createAvailbiltyBar(e){
  var guideId = $('#booking-page').attr('data-guide-id')
  e.preventDefault();
  e.stopPropagation();
  $.ajax({method:'GET',
          url: '/guides/' + guideId + '/bookings',
          dataType:'JSON',
          success: function(data){
              availableArray = showAvailabiltyOnThisDate(data)
              var duration = data.duration;
              var scheduleHour = parseInt($('#booking_date_4i').val());
              console.log(scheduleHour + " scheduleHour");
              minRange = scheduleHour - 4;
              maxRange = scheduleHour + 8;
              for (x = minRange; x <= maxRange; x++){
                var time = x + ":00"
                $('#availabiltiy-bar #availability-box-'+ (x-minRange+1) + ' .hourSpan').html(time);
                var currentBox = $('#availabiltiy-bar #availability-box-'+ (x - minRange));
                if (availableArray[x] === false){
                  currentBox.removeClass();
                  currentBox.toggleClass("square redSquare");
                }else {
                  currentBox.removeClass();
                  currentBox.toggleClass("square greenSquare");
                }
              }
          }
  });
}

function showAvailabiltyOnThisDate(data){

  // this function accepts the date and duration of a booking, and compares it with the
  // date seleceted on the page and creates and array of 24 hour, if the index at hour
  // = trued then the time slot is avialable, if it is flase then it is not
  //  using moment to be able to do date - day comparison easily

var selectHour = $('#booking_date_4i').val()
var selectedDay = $('#booking_date_3i').val();
var selectedMonth = $('#booking_date_2i').val();
// not for the next line, moment seems to start months at 0 = jan the DOM returns 1 = jan
var daySelected = moment([2016, selectedMonth-1, selectedDay,0,0,0,0]);
var availableArray = new Array();
for (x=0;x<24;x++){
  availableArray.push(true);
}
////make false specific times unavialble on this day
 for (var booking = 0;booking < data.length;booking++){
   var bookingDate = moment(data[booking].date);
   // next accomidate for the difference in timezones (BOOKING IS IN UTC)...  THIS WILL NEED TO BE MADE MORE REBUST !!
   //for now we are just converting to our own timezone, eventually we will want to convert everything to UTC and calculete availablite on that
   bookingDate.add(4, 'h');
    if ( daySelected.isSame(bookingDate, 'day')){
      // if the finishing or the starting of the booking
      // is 4 hours before or 8hour  after the booking time we need to load it
      // into the
      for (var hour = 0;hour < data[booking].duration; hour++){
        availableArray[bookingDate.hour() + hour] = false;
      }
    }
 }
 return availableArray;
}
