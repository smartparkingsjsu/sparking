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

    // TODO: Move to license plate js file
    var $this;
    var $parent;

    $("#add-license").click(function() {
        setTimeout(function(){
            $('.tooltipped').tooltip({delay: 50});
            refreshRemoveJquery();
        }, 400);
    });

    refreshRemoveJquery();

    function refreshRemoveJquery() {
        $(".remove-license").click(function() {
            $this = $(this);
            $parent = $this.parent().parent();
            if ($parent.find("a").hasClass("dynamic")) {
                $parent.hide(500, function() {$parent.remove()});
            }
            else {
                $parent.hide(500);
            }
        });
    }

});
