class ApplicationController < ActionController::Base
  before_filter :get_factions
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
    @points_used = 0
    @army.army_units.each do |army_unit|
      if army_unit.unit.unit_type.name != 'caster'
        @points_used += army_unit.unit.point_cost
      else
        battlegroup_points = 0
        army_unit.units.each do |attachment|
          battlegroup_points += attachment.point_cost
        end
        if battlegroup_points > army_unit.unit.point_cost
          @points_used += (battlegroup_points - army_unit.unit.point_cost)
        end
      end
      if army_unit.unit.field_allowance == 'c'
        @banned_unit_ids << army_unit.unit_id
      end
    end
    
  end
  
  def list_available_models
    find_and_analyze_army(params[:armyid])
    @available_units = available_units
    respond_to do |format|
      format.js
    end
  end

  private

  def available_units
    if @banned_unit_ids.empty?
      Unit.where('unit_type_id =? AND faction_id = ?', params[:type], params[:factionid]).where('point_cost <= (?)', (@army.points - @points_used))
    else
      Unit.where('unit_type_id =? AND faction_id = ?', params[:type], params[:factionid]).where('id not in (?)', @banned_unit_ids).where('point_cost <= (?)', (@army.points - @points_used))
    end
  end

  def get_factions
    @factions = Faction.all
  end

end
