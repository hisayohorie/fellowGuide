

$(document).on('ready page:load', function(e){


  // $('#availabiltiy-bar > div').toggleClass("square greenSquare");
   //createAvailbiltyBar(e);

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

<<<<<<< HEAD
  //this is the mechanisim that makes sure the button happens
  var booking_button_has_fired = false

  $('#booking_button input').on('click',function(e){
    if (booking_button_has_fired === true) {
        booking_button_has_fired = false; // reset flag
        return; // let the event bubble away
    }


    e.preventDefault();
    e.stopPropagation();
    var guideId = $('#booking-page').attr('data-guide-id')
    var self = this;
    $.ajax({method:'GET',
            url: '/guides/' + guideId + '/bookings',
            dataType:'JSON',
            success: function(data){

                availableArray = showAvailabiltyOnThisDate(data);
                var selectedHour = $('#booking_date_4i').val();
                var selectedDay = $('#booking_date_3i').val();
                var selectedMonth = $('#booking_date_2i').val()-1;
                var selectedYear = $('#booking_date_1i').val();

                var daySelected = moment([selectedYear, selectedMonth, selectedDay,selectedHour ,0,0,0]);

                //moment('2010-10-20').isSame('2010-10-20'); // true


                var conflict = false;

                // Check to see if the start is withing an exsisiting booking
                for (var x = 0; x<data.length; x++){
                  var acceptedBookingStart = moment(data[x].date);
                  //account for timezone shift... fix this for all zones later
                  acceptedBookingStart.add(4,'h');
                  var acceptedDuration = parseInt(data[x].duration);
                  var acceptedBookingEnd = acceptedBookingStart.clone();
                  acceptedBookingEnd.add(acceptedDuration,'hours');


                  //true if day in time after
                  var sameOrAfterStart = daySelected.isSameOrAfter(acceptedBookingStart, 'hour');
                  //true if day in time before
                  var sameOrBeforeEnd = daySelected.isSameOrBefore(acceptedBookingEnd, 'hour');

                  try{
                    if (sameOrAfterStart && sameOrBeforeEnd) throw "booked"
                  }
                  catch(err){
                    alert("The guide is allready " + err + "!");
                    return;
                  }
                  //
                  // acceptedBookingStart.minutes(0);
                  // acceptedBookingStart.seconds(0);
                  // daySelected.minutes(0);
                  // daySelected.second(0);
                  //
                  // console.log(acceptedBookingStart.format('M, D, Y, h,m') + " Booking Start " + x);
                  // console.log(acceptedBookingEnd.format('M, D, Y, h') + " Booking end " + x);
                  // console.log(acceptedDuration + " Duration" + x);
                  // console.log(daySelected.format('M, D, Y, h,m,s') );

                }

              booking_button_has_fired = true;
              console.log(self);
              // $(self).trigger('click');

            }
        });
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
              minRange = scheduleHour - 4;
              maxRange = scheduleHour + 8;
              for (x = minRange; x <= maxRange; x++){
                var time = x + ":00"
                $('#availabiltiy-bar #availability-box-'+ (x-minRange) + ' .hourSpan').html(time);
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
