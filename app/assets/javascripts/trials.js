var ready;
ready = function() {

  $('#expandFullLink').on("click",function () {
        console.log('test1');
        $('#expandFullDescription').slideToggle();
        var arrowPosition = $("#expandFullLink .expandIcon").html();
        if (arrowPosition == "▼") {
            console.log('test2');
            $("#expandFullLink .expandIcon").html("&#9650;");
        } else {
            console.log('test3');
            $("#expandFullLink .expandIcon").html("▼");
        }
    });

    $('#expandExclusion').on("click",function () {
        $('#exclusionCriteria').slideToggle();
        var arrowPosition = $("#expandExclusion .expandIcon").html();
        if (arrowPosition == "▼") {
            $("#expandExclusion .expandIcon").html("&#9650;");
        } else {
            $("#expandExclusion .expandIcon").html("▼");
        }
    });

    $(".close").on("click",function(){
        $(this).parent().fadeOut();
        $.cookie('signup_div_viewed', true);
    })

};

$(document).ready(ready);
$(document).on('page:load', ready);
