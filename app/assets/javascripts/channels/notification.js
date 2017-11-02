registerSomeChannel = function(bleh) {
    App.cable.subscriptions.create({
        channel: "NotificationChannel",
        garage_id: bleh
    }, {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
            var $notification = $('#logo-notification');
            var count = $notification.text();

            if (data.notification === "") {
                if (count == 0) {
                    $notification.show();
                }
                $notification.text(++count);
            }
            else {
                if (count == 1) {
                    $notification.hide();
                }
                $notification.text(--count);
            }
            return true
        }
    });
};