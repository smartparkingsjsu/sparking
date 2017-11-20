$(document).ready(function() {
    var $addBtn = $('#add-license');
    $addBtn.click(function() {
        $(this).hide();
        setTimeout(function() {
            $('.remove-license').click(function() {
                $addBtn.show();
            });
        }, 400);
    });
});