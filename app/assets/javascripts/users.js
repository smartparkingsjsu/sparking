$(document).ready(function() {

    var elementEnum = {
        ACCOUNT: $("#account"),
        VEHICLE: $("#vehicle"),
        HISTORY: $("#history"),
        EDIT: $("#edit"),
        VEHICLE_EDIT: $("#vehicle-edit"),
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
            Materialize.updateTextFields();
        }
        editToggle = !editToggle; 
    });

    $("#vehicle-edit-toggle").click(function() {
        if ( editToggle ) {
            elementEnum.VEHICLE_EDIT.slideUp("slow");
        }
        else {
            elementEnum.VEHICLE_EDIT.slideDown("slow");
            Materialize.updateTextFields();
        }
        editToggle = !editToggle; 
    });

    $("#vehicle-toggle").click(function() {
        fadeOut(elementEnum.ALL);
        fadeIn(elementEnum.VEHICLE);
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
