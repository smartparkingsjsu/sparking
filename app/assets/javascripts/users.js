$(document).ready(function() {

    var elementEnum = {
        EDIT: $("#edit"),
        VEHICLE_EDIT: $("#vehicle-edit")
    };

    var editToggle = false;

    $("#edit-toggle").click(function() {
        if ( editToggle ) {
            elementEnum.EDIT.slideUp("slow");
        }
        else {
            elementEnum.EDIT.slideDown("slow");
        }
        editToggle = !editToggle; 
    });

    $("#vehicle-edit-toggle").click(function() {
        if ( editToggle ) {
            elementEnum.VEHICLE_EDIT.slideUp("slow");
        }
        else {
            elementEnum.VEHICLE_EDIT.slideDown("slow");
        }
        editToggle = !editToggle; 
    });

    function fadeOut(element) {
        element.fadeOut(200);
    }

    function fadeIn(element) {
        element.slideUp( 300 ).delay( 300 ).fadeIn( 400 );
    }

});
