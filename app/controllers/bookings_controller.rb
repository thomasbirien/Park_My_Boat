class BookingsController < ApplicationController
  def show
  end

  def new
  end

  def create

    @booking = current_user.bookings.new(booking_params)
    @port =  Place.find(@booking.place_id).port

    if @booking.save
      redirect_to profile_path
    else
      @place_id = @booking.place_id
      @arrival_date = @booking.arrival_date.strftime("%d/%m/%Y")
      @departure_date = @booking.departure_date.strftime("%d/%m/%Y")
      @invoiced = @booking.invoiced_price

      render 'ports/show'
    end


  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

  private
  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date, :comment, :place_id)
  end
end
