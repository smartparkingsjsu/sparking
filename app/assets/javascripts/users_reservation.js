$(document).ready(function() {
    // Open the n+1 child that got clicked
    $('.booking-row').click(function() {
        var index = $(this).index();

        $('.booking-table').children().eq(index+1).toggle("slow");
    });
});