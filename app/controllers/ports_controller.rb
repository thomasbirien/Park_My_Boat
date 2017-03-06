class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    port_filter = PortFilter.new(params)
    port_filter.filter
    @ports = port_filter.ports
    @places = port_filter.places

    build_markers

    @target = {
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date],
    }
  end

  def show
    @port_places = filter_places.map do |place|b
      if place.port_id == params[:id].to_i
        place
      end
    end

    @port = Port.find(params[:id])
    @arrival_date = (Date.strptime(params[:arrival_date], '%d/%m/%Y'))
    @departure_date = (Date.strptime(params[:departure_date], '%d/%m/%Y'))
    @price = @port.places.order(:place_price).last.place_price
    @booking = Booking.new
    @invoiced = @price * (@departure_date - @arrival_date).to_i
    # @user_boat = current_user.boat_ids.first
  end

  private

  def build_markers
    @hash = Gmaps4rails.build_markers(@ports_selected) do |port, marker|
      marker.lat port.lat
      marker.lng port.lng
    end
  end
end
