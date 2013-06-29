class FactionsController < ApplicationController
  load_and_authorize_resource :except => [:index, :show]

  def index
    @factions = Faction.all
  end

  def show
    @faction = Faction.find(params[:id])
  end

  def new
    @faction = Faction.new
  end

  def edit
    @faction = Faction.find(params[:id])
  end

  def create
    @faction = Faction.new(params[:faction])
    if @faction.save
      redirect_to @faction, notice: 'Faction was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @faction = Faction.find(params[:id])
    if @faction.update_attributes(params[:faction])
      redirect_to @faction, notice: 'Faction was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @faction = Faction.find(params[:id])
    @faction.destroy
    redirect_to factions_url
  end
end
