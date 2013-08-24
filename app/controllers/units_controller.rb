class UnitsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    if params[:faction]
      @units = Unit.where("faction_id = ?", params[:faction])
      @faction = Faction.find(params[:faction])
      if @faction.game_id == 1
        @unit_types = ['caster', 'warjack', 'unit', 'solo', 'attachment', 'battle engine']
      else
        @unit_types = ['caster', 'warbeast', 'unit', 'solo', 'attachment', 'battle engine']
      end
    else
      @units = Unit.all
    end
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def edit
    authorize! :edit, @unit, :message => 'Not authorized to manage models'
    @unit = Unit.find(params[:id])
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
    redirect_to :back, notice: "The model #{@unit.name} has been removed."
  end

  def list_attachables
    find_and_analyze_army(params[:armyid])
    parent_unit = ArmyUnit.find(params[:armyunitid])
    if parent_unit.unit.unit_type.name = 'caster'
      unit_type = UnitType.where('name = ?', 'warjack').first
      @available_attachments = Unit.where('faction_id = ? AND unit_type_id = ?', params[:factionid], unit_type.id)
      @parent_unit = parent_unit
    end
  end

end
