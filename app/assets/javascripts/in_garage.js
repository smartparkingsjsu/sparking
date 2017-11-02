$(document).ready(function() {

    $elementEnum = {
        "question" : $('#i-question'),
        "no" : $('#i-no-book'),
        "yes" : $('#i-book'),
    };

    $('#i-book-btn').click(function() {
        $elementEnum.question.toggle();
        $elementEnum.yes.toggle("slow");
    });

    $('#i-no-book-btn').click(function() {
        $elementEnum.question.toggle();
        $elementEnum.no.toggle("slow");
    });

    $('#i-book-back-btn').click(function() {
        $elementEnum.yes.toggle();
        $elementEnum.question.toggle("slow");
    });

    $('#i-no-book-back-btn').click(function() {
        $elementEnum.no.toggle();
        $elementEnum.question.toggle("slow");
    });
});