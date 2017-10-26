$(document).ready(function() {
    var dummyData = [
        {
            "message": "License plate mismatch",
            "location": "L1_01",
            "expected_license": "NANI!?",
            "solved": false,
            "date": "10/25/17",
            "booking_id": 1
        },
        {
            "message": "License plate mismatch",
            "location": "L1_01",
            "expected_license": "NANI!?",
            "solved": true,
            "date": "10/25/17",
            "booking_id": 2
        },
        {
            "message": "License plate mismatch",
            "location": "L1_01",
            "expected_license": "NANI!?",
            "solved": true,
            "date": "10/25/17",
            "booking_id": 3
        },
        {
            "message": "License plate mismatch",
            "location": "L1_01",
            "expected_license": "NANI!?",
            "solved": false,
            "date": "10/25/17",
            "booking_id": 4
        },
        {
            "message": "License plate mismatch",
            "location": "L1_01",
            "expected_license": "NANI!?",
            "solved": false,
            "date": "10/25/17",
            "booking_id": 5
        }
    ];

    var elementEnum = {
        "solveButton": '<a class="solve-btn waves-effect waves-light btn">Solve</a>\n',
        "checkIcon": '<i class="small material-icons">check_circle</i>'
    };


    // TODO: Remove later
    for (var i=0; i < dummyData.length; i++) {
        addNotification(dummyData[i]);
    }

    var $this;
    var $parent;

    $(".solve-btn").click(function() {
        $this = $(this);

        console.log("I am", $this);
        console.log("My parent is", $parent);

        // Open modal
        $("#confirmation-modal").modal('open');
    });

    $("#yes-btn").click(function() {
        $("#confirmation-modal").modal('close');
        $parent = $this.parent();
        $this.remove();
        $parent.append(elementEnum.checkIcon);

        // Send put request
    });

    $("#no-btn").click(function() {
        $("#confirmation-modal").modal('close');
    });

    function addNotification(data) {
        var $solveElement = '';

        if (data.solved) {
            $solveElement = elementEnum.checkIcon;
        }
        else {
            $solveElement = elementEnum.solveButton;
        }

        var $notification = '<div class="row notification-block valign-wrapper">\n' +
                                '<div class="col s8">\n' +
                                    '<div><span>Problem: ' + data.message + '</span></div>\n' +
                                    '<div><span>Where: ' + data.location + '</span></div>\n' +
                                    '<div><span>Expected License Plate: ' + data.expected_license + '</span></div>\n' +
                                '</div>\n' +
                                '<div class="col s4 right-align">\n' +
                                    $solveElement +
                                '</div>\n' +
                            '</div>';

        // Add a row
        $(".notification-wrapper").append($notification);
    }

});