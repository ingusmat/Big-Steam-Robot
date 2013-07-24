class ArmyUnitsController < ApplicationController
  def destroy
    army_unit = ArmyUnit.find(params[:armyUnitId])
    army_unit.destroy
    find_and_analyze_army(params[:armyId])
    @available_units = available_units
    respond_to do |format|
      format.js
    end
  end

  def create
    army_unit = ArmyUnit.create(unit_id: params[:unitId], army_id: params[:armyId])
    army_unit.save
    params[:unit_type] = army_unit.unit.unit_type.name
    find_and_analyze_army(params[:armyId])
    params[:faction_id] = @army.faction_id
    @available_units = available_units
  end
  
  def min_max_unit_toggle
    army_unit = ArmyUnit.find(params[:armyUnitId])
    army_unit[:max_unit] = (army_unit[:max_unit] ? false : true)
    army_unit.save
    find_and_analyze_army(params[:armyId])
  end
end
