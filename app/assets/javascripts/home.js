$(document).ready(function(){
    var options = [
        {selector: '#staggered-2', offset: 400, callback: function(el) {
            Materialize.toast("This is our ScrollFire Demo!", 1500 );
        } },
        {selector: '#staggered-2', offset: 400, callback: function(el) {
            Materialize.showStaggeredList($(el));
        } },
        {selector: '#staggered-3', offset: 500, callback: function(el) {
            Materialize.showStaggeredList($(el));
        } }
    ];
    Materialize.scrollFire(options);

});