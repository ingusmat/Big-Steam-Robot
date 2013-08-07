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
    count_up_the_points 
    @banned_unit_ids = []
    @army.army_units.each do |army_unit|
      if army_unit.unit.field_allowance == 'c'
        @banned_unit_ids << army_unit.unit_id
      end
    end
  end
  
  def list_available_models
    find_and_analyze_army(params[:armyId])
    @unit_type = params[:unitType]
    @dom_parent_id = params[:domParentId]
    @available_units = available_units
    respond_to do |format|
      format.js
    end
  end

  private

  def count_up_the_points
    @all_units = ArmyUnit.where('army_id = ?', @army.id)
    @points_used = 0
    @army.army_units.each do |army_unit|
      if army_unit.unit.unit_type.name == 'caster'
        unless army_unit.attachments.empty?
          attachment_points = 0
          army_unit.child_army_units.each do |child|
            attachment_points += child.unit.point_cost
          end
          if attachment_points < army_unit.unit.point_cost
            @points_used -= attachment_points
          else
            @points_used -= army_unit.unit.point_cost
          end
        end
      elsif army_unit[:max_unit]
        @points_used += army_unit.unit.max_point_cost
      else
        @points_used += army_unit.unit.point_cost
      end
    end

  end

  def available_units
    unit_type = UnitType.select('id').where('name = ?', params[:unitType])
    if @banned_unit_ids.empty?
      Unit.where('unit_type_id =? AND faction_id = ?', unit_type, params[:factionId]).where('point_cost <= (?)', (@army.points - @points_used))
    else
      Unit.where('unit_type_id =? AND faction_id = ?', unit_type, params[:factionId]).where('id not in (?)', @banned_unit_ids).where('point_cost <= (?)', (@army.points - @points_used))
    end
  end

  def get_factions
    @factions = Faction.all
  end

end
