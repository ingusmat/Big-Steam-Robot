class AttachmentsController < ApplicationController
  def create
    new_army_unit = ArmyUnit.new(unit_id: params[:unitId], army_id: params[:armyId])
    new_army_unit.save
    @attachment = Attachment.new(parent_army_unit_id: params[:parentUnitId], child_army_unit_id: new_army_unit[:id])
    if @attachment.save
      @points_used = calculate_points(@attachment.parent_army_unit.army)
    end
    respond_to { |format| format.js }
  end
  
  def destroy
    attachment = Attachment.find(params[:attachmentId])
    attachment.destroy
    find_and_analyze_army(params[:armyid])
    @available_units = available_units
    respond_to do |format|
      format.js
    end
  end

end
