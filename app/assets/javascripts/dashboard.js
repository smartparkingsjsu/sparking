$(document).ready(function(){

    // Change timer to 30 mins, 5 secs right now
    gon.watch("bookings", {interval: 5000}, renewBookings);

    var bookingsLength = gon.bookings.length

    function renewBookings(newVal) {
        $("#swipe-1").text(newVal.length);
    }

});