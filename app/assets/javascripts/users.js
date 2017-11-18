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

    var activeClass = "active-main";
    var inactiveClass = "inactive-main";
    var topRight = "top-right";
    var bottomRight = "bottom-right";
    var panel = "card-panel";
    var isAnimated = false;

    var activeHeight = getElemHeight($('.active-main'));
    $('.active-main').height(activeHeight);

    $('.custom-container').click(function(){
        var $this=$(this);

        if($this.hasClass(inactiveClass) && isAnimated==false){
            var $parent=$this.parent();
            var $leftSib=$parent.find('.active-main');
            isAnimated=true;
            var $contentMain = jQuery($this).children().first().children().last();
            var contentHeight = getElemHeight(jQuery($this));
            // $this.removeClass(panel);
            // jQuery($this).children().first().addClass(panel);
            // $leftSib.addClass(panel);
            // $leftSib.children().removeClass(panel);

            if($this.hasClass(topRight)){
                var $rightSib=$parent.find('.bottom-right');
                $leftSib.removeClass(activeClass).addClass(bottomRight, 300).addClass(inactiveClass, 500).animate({height: "10em"}, 50);
                $this.removeClass(inactiveClass, 500).removeClass(topRight, 500).addClass(activeClass, 500).animate({height: contentHeight}, 50);
                $rightSib.removeClass(bottomRight, 800).addClass(topRight, 500);

            }
            else{
                var $rightSib=$parent.find('.top-right');
                $leftSib.removeClass(activeClass).addClass(inactiveClass, 600).addClass(topRight, 600).animate({height: "10em"}, 100);
                $this.removeClass(inactiveClass, 300).removeClass(bottomRight, 150).addClass(activeClass, 500).animate({height: contentHeight}, 100);
                $rightSib.removeClass(topRight, 800).addClass(bottomRight, 500);
            }

            $contentMain.animate({opacity: 100}, 400);

            $leftSib.children().first().children().last().animate({opacity: 0}, 400);

            setTimeout(function(){
                isAnimated=false;

            },1000);
        }
    });

    function getElemHeight($elem){
        var $contentMain = $elem.children().first().children().last();
        var $preview = $elem.children().first().children().first();
        var contentHeight = parseInt($contentMain.css("height"))+ parseInt($preview.css("height"))+
            parseInt($contentMain.css("padding-top"))+ parseInt($contentMain.css("padding-bottom")) +
            parseInt($contentMain.css("margin-top")) + parseInt($contentMain.css("margin-bottom")) +
            parseInt($preview.css("padding-top")) + parseInt($preview.css("padding-bottom")) +
            parseInt($preview.css("margin-top")) + parseInt($preview.css("margin-bottom")) +
            parseInt($elem.css("padding-top")) + parseInt($elem.css("padding-bottom"));
        console.log(contentHeight);
        return contentHeight;
    }
});
