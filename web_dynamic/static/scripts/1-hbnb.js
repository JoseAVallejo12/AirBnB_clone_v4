let amenitiesList = []
$('input[type=checkbox]').prop('checked', false);

$('input[type="checkbox"]').click(function(){
    if($(this).prop("checked") == true){
        amenitiesList.push($(this).attr('data-name'))

        $( "#select" ).text(amenitiesList).css({
            "width": "100%",
            "height": "100%",
            "white-space": "nowrap",
            "overflow": "hidden",
            "text-overflow": "ellipsis",
            "padding-bottom": "16px"
        });

    } else if($(this).prop("checked") == false){
        let idx = 0;
        amenitiesList.forEach((elemt) => {
            if (elemt == $(this).attr('data-name'))
                amenitiesList.splice(idx, 1);
            idx += 1;
        });
        $("#select").text(amenitiesList)
   }
});
