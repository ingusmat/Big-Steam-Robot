class ArmyUnitsController < ApplicationController
  def destroy
    @army_unit = ArmyUnit.find(params[:armyUnitId])
    @army_unit.destroy
    respond_to { |format| format.json }
  end

  def create
    @army_unit = ArmyUnit.create(unit_id: params[:unitId], army_id: params[:armyId])
    @army_unit.save
    respond_to { |format| format.js }
  end
  
  def min_max_unit_toggle
    army_unit = ArmyUnit.find(params[:armyUnitId])
    army_unit[:max_unit] = (army_unit[:max_unit] ? false : true)
    army_unit.save
    find_and_analyze_army(params[:armyId])
  end
end
