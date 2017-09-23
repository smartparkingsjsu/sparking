$(document).ready(function(){
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

});