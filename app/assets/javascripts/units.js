$(document).ready(function(){
  unit_form.point_cost_label();
  unit_form.attaches_to_visibility();
  unit_form.attaches_to_visibility()
  $("#unit_unit_type_id").change(function(){
    unit_form.point_cost_label()
    unit_form.attaches_to_visibility()
  });
  $("#unit_faction_id").change(function(){
    unit_form.point_cost_label()
  });
});

var unit_form = {
  point_cost_label: function(){
    if($("#unit_unit_type_id").val() == 3){
      $("label[for='unit_point_cost']").text("Min-Unit Points")
      $("label[for='unit_max_point_cost']").toggleClass('hidden', false)
      $("#unit_max_point_cost").toggleClass('hidden', false)
    } else {
      $("label[for='unit_max_point_cost']").toggleClass('hidden', true)
      $("#unit_max_point_cost").toggleClass('hidden', true)
      $("#unit_max_point_cost").val('')
      if($("#unit_unit_type_id").val() == 1){
        if($("#unit_faction_id").val() <= 7){
          $("label[for='unit_point_cost']").text("Warjack Points")
        } else {
          $("label[for='unit_point_cost']").text("Warbeast Points")
        }
      } else {
        $("label[for='unit_point_cost']").text("Point Cost")
      }
    }
  },
  attaches_to_visibility: function(){
    if($("#unit_unit_type_id").val() == 6){
      $("label[for='unit_parent_unit_id']").toggleClass('hidden', false)
      $("#unit_parent_unit_id").toggleClass('hidden', false)
    } else {
      $("#unit_parent_unit_id").toggleClass('hidden', true)
      $("label[for='unit_parent_unit_id']").toggleClass('hidden', true)
    }
  },
  min_and_max_points: function(){
    if($("#unit_unit_type_id").val() == 3){
      $("label[for='unit_parent_unit_id']").toggleClass('hidden', false)
      $("#unit_parent_unit_id").toggleClass('hidden', false)
    } else {
      $("#unit_parent_unit_id").toggleClass('hidden', true)
      $("label[for='unit_parent_unit_id']").toggleClass('hidden', true)
    }
  }

}
