$(document).ready(function() {

    var elementEnum = {
        ACCOUNT: $("#account"),
        VEHICLE: $("#vehicle"),
        PAYMENT: $("#payment"),
        HISTORY: $("#history"),
        EDIT: $("#edit"),
        ALL: $(".profile-container")
    };

    var editToggle = false;


    $("#account-toggle").click(function() {
        fadeOut(elementEnum.ALL);
        fadeIn(elementEnum.ACCOUNT);
        $('.button-collapse').sideNav('hide');
    });

    $("#edit-toggle").click(function() {
        if ( editToggle ) {
            elementEnum.EDIT.slideUp("slow");
        }
        else {
            elementEnum.EDIT.slideDown("slow");
        }
        editToggle = !editToggle; 
    });

    $("#vehicle-toggle").click(function() {
        fadeOut(elementEnum.ALL);
        fadeIn(elementEnum.VEHICLE);
        $('.button-collapse').sideNav('hide');
    });

    $("#payment-toggle").click(function() {
        fadeOut(elementEnum.ALL);
        fadeIn(elementEnum.PAYMENT);
        $('.button-collapse').sideNav('hide');
    });

    $("#history-toggle").click(function() {
        fadeOut(elementEnum.ALL);
        fadeIn(elementEnum.HISTORY);
        $('.button-collapse').sideNav('hide');
    });

    function fadeOut(element) {
        element.fadeOut(200);
    }

    function fadeIn(element) {
        element.slideUp( 300 ).delay( 300 ).fadeIn( 400 );
    }

});
