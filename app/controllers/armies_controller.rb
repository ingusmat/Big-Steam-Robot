class ArmiesController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :new]

  def index
    if params[:user]
      if current_user[:id] == params[:user]
        @armies = Army.where("user_id = ?", params[:user]).order("created_at DESC")
      else
        @armies = Army.where("user_id = ? AND private = ?", params[:user], false).order("created_at DESC")
      end
    else
      @armies = Army.where("private = ?", false).order("created_at DESC")
    end
  end

  def show
    find_and_analyze_army(params[:id])
  end

  def new
    @army = Army.new
  end

  def create
    @army = Army.new(params[:army])
    if @army.save
        redirect_to @army, notice: 'Army list was successfully created.'
    else
      render action: "new"
    end
  end
  
  def edit
    @army = Army.find(params[:id])
  end

  def update
    @army = Army.find(params[:id])
    if @army.update_attributes(params[:army])
      redirect_to @army, notice: 'Army successfully updated'
    else
      render action: "edit"
    end
  end

  def destroy
    @army = Army.find(params[:id])
    @army.destroy
    redirect_to :back
  end

  private


end
