class BookingsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end
end
