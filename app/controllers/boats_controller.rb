#not use for now

class BoatsController < ApplicationController
  before_action :set_boat, only: [:edit, :update, :destroy]

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
  end

  def update
    if @boat.update(boat_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to profile_path
  end


  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params
      .require(:boat)
      .permit(
        :brand,
        :manufacturer,
        :nickname,
        :immatriculation,
        :model,
        :boat_type,
        :length,
        :width,
        :draught,
        :multihull
      )
  end
end
