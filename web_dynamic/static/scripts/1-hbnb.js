let amenitiesList = []
$('input[type=checkbox]').prop('checked', false);

$('input[type="checkbox"]').click(function(){
    if($(this).prop("checked") == true){
        amenitiesList.push($(this).attr('data-name'))
        $("#select").text(amenitiesList)


    } else if($(this).prop("checked") == false){
        amenitiesList.pop()
        $("#select").text(amenitiesList)

   }
});
