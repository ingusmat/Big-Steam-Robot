class UnitsController < ApplicationController
  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def edit
    @unit = Unit.new(params[:id])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(params[:unit])
    if @unit.save
      redirect_to @unit, notice: 'Unit was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update_attributes(params[:unit])
      redirect_to @unit, notice: 'Unit was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    redirect_to units_url
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
      Unit.where('unit_type_id =? AND faction_id = ?', params[:type], params[:factionid])
    else
      Unit.where('unit_type_id =? AND faction_id = ?', params[:type], params[:factionid]).where('id not in (?)', @banned_unit_ids)
    end
  end

end
