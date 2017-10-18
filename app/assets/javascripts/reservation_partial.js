$(document).ready(function() {

    var $endOptions = $('#end_time');
    var $endOptionsReference = $endOptions.children().clone();

    $('.start-select').change(function() {
        var selectedIndex = $(this).prop('selectedIndex');

        var $newEndOptions = $endOptionsReference.clone();

        for (i=0; i<(selectedIndex+1); i++) {
            $newEndOptions.splice(0, 1);
        }

        $endOptions.empty();
        $endOptions.append($newEndOptions);
        $endOptions.material_select();
    });
});