$(document).ready(function(){
  $(".add").click(function(e){
    e.preventDefault();
    $.post("/" + $(this).attr('data-controller') + "/" + $(this).attr('data-action') + ".js", $(this).data(), null, "script");
  })
  $(".remove_unit").click(function(e){
    e.preventDefault();
    $.post("/army_units/destroy.js", $(this).data(), null, "script");
  })
});
