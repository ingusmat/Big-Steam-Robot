class AttachmentsController < ApplicationController
  def create
    
    attachment = Attachment.new(army_unit_id: params[:armyUnitId], unit_id: params[:attachedUnitId])
    if attachment.save
      find_and_analyze_army(params[:armyId])
      @available_units = available_units
    end
    respond_to do |format|
      format.js
    end
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
