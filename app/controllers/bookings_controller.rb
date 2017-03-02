class BookingsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to profile_path
    else
      render 'port/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end
end
