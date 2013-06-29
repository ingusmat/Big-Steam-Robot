class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  def find_and_analyze_army(army_id)
    @army = Army.find(army_id)
    @roster = @army.units.group_by { |unit| unit.unit_type_id}
    analyse_list

  end

  def analyse_list
    @banned_unit_ids = []
    points_used = 0
    @army.units.each do |unit|
      if unit.unit_type.name != 'caster'
        points_used += unit.point_cost
      end
      if unit.field_allowance == 'c'
        @banned_unit_ids << unit.id
      end
    end
    
  end
end
