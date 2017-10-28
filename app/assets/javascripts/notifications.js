$(document).ready(function() {
    var dummyData = {"unread_number": 2};

    updateNotification();

    function updateNotification() {
        $('#logo-notification').text(dummyData.unread_number);
        dummyData.unread_number++;

        console.log("Number", dummyData.unread_number);

        // TODO: testing, change later
        setTimeout(updateNotification, 1000);
    }
});