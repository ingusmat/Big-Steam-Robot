class ArmyUnitsController < ApplicationController
  def destroy
    @army = Army.find(params[:armyid])
    army_unit = ArmyUnit.find(params[:armyunitid])
    army_unit.destroy
    respond_to do |format|
      format.js
    end
  end
end
