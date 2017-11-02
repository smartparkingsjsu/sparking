$(document).ready(function() {

    $('#time').children().last().remove();
    $('#end_time').children().first().remove();
    $('#time').material_select();
    $('#end_time').material_select();

    var $endOptions = $('#end_time');
    var $endOptionsReference = $endOptions.children().clone();

    $('.start-select').change(function() {
        var selectedIndex = $(this).prop('selectedIndex');

        var $newEndOptions = $endOptionsReference.clone();

        for (i=0; i<(selectedIndex); i++) {
            $newEndOptions.splice(0, 1);
        }

        $endOptions.empty();
        $endOptions.append($newEndOptions);
        $endOptions.material_select();
    });

    var $input = $('.datepicker').pickadate();
    // Use the picker object directly.
    var picker = $input.pickadate('picker');
    picker.set('select', new Date());

});