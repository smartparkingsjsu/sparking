registerSomeChannel = function(bleh) {
    App.cable.subscriptions.create({
        channel: "NotificationChannel",
        garage_id: bleh
    }, {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
            var count = $('#logo-notification').text();

            if (data.notification === "") {
                $('#logo-notification').text(++count);
            }
            else {
                $('#logo-notification').text(--count);
            }
            return true
        }
    });
}