$(document).ready(function() {

    var elementEnum = {
        EDIT: $("#edit"),
        VEHICLE_EDIT: $("#vehicle-edit"),
        RESIZE: $(".resize-trigger"),
        ACTIVE: $('.active-main'),
        CONTAINER : $('.custom-container')
    };

    var editToggle = false;

    $("#edit-toggle").click(function() {
        if ( editToggle ) {
            elementEnum.EDIT.slideUp(500);
        }
        else {
            elementEnum.EDIT.slideDown(500);
        }
        editToggle = !editToggle; 
    });

    $("#vehicle-edit-toggle").click(function() {
        //changeContent($('.active-main'));
        if ( editToggle ) {
            elementEnum.VEHICLE_EDIT.hide(500);
        }
        else {
            elementEnum.VEHICLE_EDIT.show(500);
        }
        editToggle = !editToggle; 
    });

    elementEnum.RESIZE.click(function(){
        changeContent($('.active-main'));
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
            setTimeout(function() {changeContent($('.active-main'))}, 25);
        });
    }

    var activeClass = "active-main";
    var inactiveClass = "inactive-main";
    var topRight = "top-right";
    var bottomRight = "bottom-right";
    var panel = "card-panel";
    var isAnimated = false;

    var activeHeight = getElemHeight(elementEnum.ACTIVE);
    elementEnum.ACTIVE.height(activeHeight);
    elementEnum.ACTIVE.children().last().children().last().css({"opacity": 100});

    elementEnum.CONTAINER.click(function(){
        var $this=$(this);

        if($this.hasClass(inactiveClass) && isAnimated==false){
            var $parent=$this.parent();
            var $leftSib=$parent.find('.active-main');
            isAnimated=true;
            var $contentMain = jQuery($this).children().first().children().last();
            var contentHeight = getElemHeight(jQuery($this));

            if($this.hasClass(topRight)){
                var $rightSib=$parent.find('.bottom-right');
                $leftSib.removeClass(activeClass).animate({height: "10em"}, 50).addClass(bottomRight, 300).addClass(inactiveClass, 500);
                $this.removeClass(inactiveClass, 500).removeClass(topRight, 500).addClass(activeClass, 500).animate({height: contentHeight}, 50, function() {
                    $contentMain.fadeTo("slow", 1);
                });
                $rightSib.removeClass(bottomRight, 800).addClass(topRight, 500);

            }
            else{
                var $rightSib=$parent.find('.top-right');
                $leftSib.removeClass(activeClass).animate({height: "10em"}, 100).addClass(inactiveClass, 600).addClass(topRight, 600);
                $this.removeClass(inactiveClass, 300).removeClass(bottomRight, 150).addClass(activeClass, 500).animate({height: contentHeight}, 100, function() {
                    $contentMain.fadeTo("slow", 1);
                });
                $rightSib.removeClass(topRight, 800).addClass(bottomRight, 500);
            }

            $leftSib.children().first().children().last().animate({opacity: 0}, 400);

            setTimeout(function(){
                isAnimated=false;

            },1000);
        }
    });

    function getElemHeight($elem){
        var $contentMain = $elem.children().first();
        var contentHeight = parseInt($contentMain.css("height")) +
            parseInt($contentMain.css("margin-top")) + parseInt($contentMain.css("margin-bottom")) +
            parseInt($elem.css("padding-top")) + parseInt($elem.css("padding-bottom"));
        return contentHeight;
    }

    function changeContent($div){
        $div.trigger($.Event('resize'));
    }

    elementEnum.CONTAINER.bind('resize', function(e) {
    });

    elementEnum.CONTAINER.resize(function() {
        $this = $('.active-main');
        var newHeight = getElemHeight($this);
        $this.animate({height: newHeight}, 300);

        setTimeout(function() {
            var newHeight = getElemHeight($this);
            $this.animate({height: newHeight}, 20);
        }, 500);

    });
});
