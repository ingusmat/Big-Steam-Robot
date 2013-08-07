$(document).ready(function(){
  $(".show-available-models").click(function(e){
    e.preventDefault();
    console.debug($(this));
    if($(this).hasClass('btn-primary')){
      $(this).removeClass('btn-primary').addClass('btn-warning');
      $(this).children('i').removeClass('icon-plus').addClass('icon-minus')
      $.post("/" + $(this).attr('data-controller') + "/" + $(this).attr('data-action') + ".js", $(this).data(), null, "script");
    } else {
      $(this).addClass('btn-primary').removeClass('btn-warning');
      $(this).children('i').addClass('icon-plus').removeClass('icon-minus')
      $("#" + $(this).attr('data-army-id') + "_available_" + $(this).attr('data-unit-type') + "s").remove()
    }
  })
  $(".remove").click(function(e){
    e.preventDefault();
    $.post("/" + $(this).attr('data-controller') + "/" + $(this).attr('data-action') + ".json", $(this).data(), function(data){
     console.debug(data); 
    }, "json");
  })
  $(".attach_unit").click(function(e){
    e.preventDefault();
    $.post("/attachments/create.js", $(this).data(), null, "script");
  })
  $(".remove_attachment").click(function(e){
    e.preventDefault();
    $.post("/attachments/destroy.js", $(this).data(), null, "script");
  })
  $(".list_attachables").click(function(e){
    e.preventDefault();
    $.post("/units/list_attachables.js", {unit: $(this).data()}, null, "script");
  })
  $(".min-max-toggle").click(function(e){
    e.preventDefault();
    $.post("/army_units/min_max_unit_toggle.js", $(this).data(), null, "script");
  })
});
