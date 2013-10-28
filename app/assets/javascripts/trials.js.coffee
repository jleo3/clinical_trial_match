# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@TODO? Where do i put this javascript???
        $('#expandFullLink').click(function () {
            $('#expandFullDescription').slideToggle();
            var arrowPosition = $("#expandFullLink .expandIcon").html();
            if (arrowPosition == "▼") {
                $("#expandFullLink .expandIcon").html("&#9650;");
                //console.log("if happened");
            } else {
                $("#expandFullLink .expandIcon").html("▼");
                //console.log("else happened");
            }
        });

        $('#expandExclusion').click(function () {
            $('#exclusionCriteria').slideToggle();
            var arrowPosition = $("#expandExclusion .expandIcon").html();
            if (arrowPosition == "▼") {
                $("#expandExclusion .expandIcon").html("&#9650;");
                //console.log("if happened");
            } else {
                $("#expandExclusion .expandIcon").html("▼");
                //console.log("else happened");
            }

        });
    