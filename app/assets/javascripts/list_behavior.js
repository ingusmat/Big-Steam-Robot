$(document).ready(function(){
  $(".show-available-models").click(function(e){
    e.preventDefault();
    if($(this).hasClass('btn-primary')){
      $(this).removeClass('btn-primary').addClass('btn-warning');
      $(this).children('i').removeClass('icon-plus').addClass('icon-minus')
      $.post("/" + $(this).attr('data-controller') + "/" + $(this).attr('data-action') + ".js", $(this).data(), null, "script");
    } else {
      $(this).addClass('btn-primary').removeClass('btn-warning');
      $(this).children('i').addClass('icon-plus').removeClass('icon-minus')
      $("#" + $(this).attr('data-army-id') + "_available_" + $(this).attr('data-unit-type') + "s").remove();
    }
  })
  $("ul.unit-group").on('click', ".remove", function(e){
    e.preventDefault();
    $.post("/" + $(this).attr('data-controller') + "/" + $(this).attr('data-action') + ".json", $(this).data(), 
      function(data){
        $("#army_unit_" + data.army_unit.id).remove();
        $('#points_used').text(data.points_used);
      }, "json");
  }).on('click', '.min-max-unit-switch', function(e){
    $.post("/army_units/min_max_unit_toggle.json", $(this).data(), 
      function(data){
        if(data.army_unit.max_unit == true){
          $("#army_unit_" + data.army_unit.id + " .point-cost").text(data.unit.max_point_cost);  
        } else {
          $("#army_unit_" + data.army_unit.id + " .point-cost").text(data.unit.point_cost);  
        }
        $('#points_used').text(data.points_used);
      }, "json");
  }).on('click', '.list_attachables', function(e){
    e.preventDefault();
    var link_data = $(this).data();
    if($(this).hasClass('btn-primary')){
      $(this).removeClass('btn-primary').addClass('btn-warning');
      $(this).children('i').removeClass('icon-plus').addClass('icon-minus');
      $.post("/units/list_attachables.js", link_data, null, "script");
    } else {
      $(this).addClass('btn-primary').removeClass('btn-warning');
      $("#" + link_data.armyunitid + "_available_attachments").remove();
      $(this).children('i').addClass('icon-plus').removeClass('icon-minus')
    }
  }).on('click', '.attach_unit', function(e){
    e.preventDefault();
    $.post("/attachments/create.js", $(this).data(), null, "script");
  });
  $(".remove_attachment").click(function(e){
    e.preventDefault();
    $.post("/attachments/destroy.js", $(this).data(), null, "script");
  })
    
});
