class ArmyUnitsController < ApplicationController
  def destroy
    army_unit = ArmyUnit.find(params[:armyunitid])
    army_unit.destroy
    find_and_analyze_army(params[:armyid])
    @available_units = available_units
    respond_to do |format|
      format.js
    end
  end
end
