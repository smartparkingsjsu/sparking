$(document).ready(function(){

    // Change timer to 30 mins, 5 secs right now for debugging
    gon.watch("bookings", {interval: 5000}, renewTable);

    function renewTable(newVal) {
        response = newVal;

        $("#table_contents").empty();

        $.each(response, function(i, item) {
            var $tr = $('<tr>').append(
                $('<td>').text(item.id),
                $('<td>').text(item.start),
                $('<td>').text(item.end),
                $('<td>').text(item.recurring),
                $('<td>').text(item.allDay)
            ).appendTo('#table_contents');
        });

        $("#table_contents").load();
    }

});