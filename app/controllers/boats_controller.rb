class BoatsController < ApplicationController
  def new
    @boat = Boat.new
  end

  def create
    @boat = current_user.boats.new(boat_params)
    if @boat.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:brand, :manufacturer, :nickname, :immatriculation, :model, :boat_type, :length, :width, :draught, :multihull)
  end
end
