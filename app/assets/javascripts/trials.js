$(document).ready(function(){
    // SHOW TRIAL PAGE
    $('#expandFullLink').click(function () {
        $('#expandFullDescription').slideToggle();
        var arrowPosition = $("#expandFullLink .expandIcon").html();
        if (arrowPosition == "▼") {
            $("#expandFullLink .expandIcon").html("&#9650;");
        } else {
            $("#expandFullLink .expandIcon").html("▼");
        }
    });

    $('#expandExclusion').click(function () {
        $('#exclusionCriteria').slideToggle();
        var arrowPosition = $("#expandExclusion .expandIcon").html();
        if (arrowPosition == "▼") {
            $("#expandExclusion .expandIcon").html("&#9650;");
        } else {
            $("#expandExclusion .expandIcon").html("▼");
        }
    });

});