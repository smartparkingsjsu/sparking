$(document).ready(function(){

    var url = "http://localhost:3000/api/v1/dashboards/" + gon.garage_id;
    var partial_url = "http://localhost:3000/garages/" + gon.garage_id + "/dashboard";
    // var url = "http://smartparkingsjsu.herokuapp.com/api/v1/dashboards/" + gon.garage_id;

    var booking_times = gon.booking_time; // booking_times[0]["value"]

    // Data format:
    // [booking, booking, ...]
    // booking = [spot_id, spot_name, start_time, end_time, user_id]

    update();

    function update() {
        $.ajax({
            type: 'GET',
            url: url,
            timeout: 2000,
            success: function(data) {
                console.log(data);
                updateTable(data);
                // 5 secs for debbugging, change later
                window.setTimeout(update, 30000);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Error fetching data");
                window.setTimeout(update, 60000);
            }
        })
    }

    function updateTable(data) {
        $('#table-contents').empty();
        $.each(data, function(i, item) {
            var $tr = $('<tr>').append(
                $('<td>').text(item[1])
            ).appendTo('#table-contents');
        });
    }
});