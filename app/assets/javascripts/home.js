$(document).ready(function(){
    var elementEnum = {
        RESERVE_BTN: $("#reserve-home-btn"),
        RESERVE_FORM: $("#reserve-form"),
        HOME_IMG: $("#img-home")
    };

    var options = [
        {selector: '#fade-image', offset: 100, callback: function(el) {
            Materialize.fadeInImage($(el));
        } },
        {selector: '#staggered-1', offset: 50, callback: function(el) {
            Materialize.showStaggeredList($(el));
        } },
        {selector: '#staggered-2', offset: 100, callback: function(el) {
            Materialize.showStaggeredList($(el));
        } },
        {selector: '#staggered-3', offset: 150, callback: function(el) {
            Materialize.showStaggeredList($(el));
        } }
    ];
    Materialize.scrollFire(options);

    elementEnum.RESERVE_BTN.click(function() {
        if (gon.user_signed) {
            if (gon.user_license != 0 && gon.user_license != null) {
                $(this).fadeOut("slow");
                elementEnum.HOME_IMG.fadeOut("slow");
                elementEnum.RESERVE_FORM.delay(580).fadeIn("slow");
            }
            else {
                window.location = "users/" + gon.user_id + "/license_plate"
            }
        }
        else {
            window.location = "login";
        }

    });

});