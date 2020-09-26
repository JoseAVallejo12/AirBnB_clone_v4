$('input[type="checkbox"]').click(function(){
    if($(this).prop("checked") == true){
        console.log("Checkbox is checked.");
    }
    else if($(this).prop("checked") == false){
        console.log("Checkbox is unchecked.");
    }
});

