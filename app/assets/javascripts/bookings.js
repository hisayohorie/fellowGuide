
var availableBox = "<div class='square greenSquare'></div>"
var bookedBox = "<div class='square greenSquare'></div>"
var requestBox = "<div class='square greenSquare'></div>"

$(document).on('ready', function(){
  var guideId = $('#booking-page').attr('data-guide-id')
console.log('guides/' + guideId + '/bookings' + " ====  URL");
  for (x=1;x<=12;x++){
    $('#availabiltiy-bar').append(availableBox);

  }

  $('#booking_date_3i').on('click', function(e){

    e.preventDefault();
    e.stopPropagation();
    $.ajax({method:'GET',
            url: '/guides/' + guideId + '/bookings',
            dataType:'JSON',
            success: function(data){
                showAvailabiltyOnThisDate(data);
            }
    });
  });

});

function showAvailabiltyOnThisDate(data){
  selectedDate = $('#booking_date_3i').val();
  var availableArray = new Array();
  // fill array with true
  for (x=0;x<availableArray;x++){
    availableArray.push(true);
  }


  ////make false specific times unavialble on this day
   for (booking=0;booking<data.length;booking++){
     date = moment(data[booking].date);
    //  using moment to be able to do date - day comparison easily
     console.log("moment day = " + date);
     console.log("the day is" + date.dayOfYear());
    // if (data[booking].date === selectedDate){
    //  for (hour=0; hour < data[booking].duration; hour++){
    //    availableArray[]
    //
    //    }
    // }
   }

}
// def availability_on_date(day)
// # THIS CLASS TAKES THE DAY OF THE MONTH AND RETURNS THE GUIDE AVAILABILITY
// # NEED TO ADD A CHECK FOR MONTH/YEAR UNIQNESS ON NEXT ITERATION
//
//       booking.duration.times{|i| availableArray[booking.date.hour + i] = false}
//     end
//   end
// end
