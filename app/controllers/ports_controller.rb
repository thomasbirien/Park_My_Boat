class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    port_filter = PortFilter.new(params)
    port_filter.filter
    @ports = port_filter.ports
    @places = port_filter.places
    @target = port_filter.cleaned_params
    @geographic_center = Geocoder::Calculations.geographic_center(@ports)

    build_markers
  end

  def show
    @port = Port.find(params[:id])


    places_filter = PlaceFilter.new(params)
    places_filter.filter
    @places = places_filter.places

    @port = Port.find(params[:id])
    @date_arr = (Date.strptime(params[:arrival_date], '%d/%m/%Y'))
    @arrival_date = @date_arr.strftime("%d/%m/%Y")
    @date_dep = (Date.strptime(params[:departure_date], '%d/%m/%Y'))
    @departure_date = @date_dep.strftime("%d/%m/%Y")
    @prices = @places.sort_by { |place| place[:place_price] }
    @price = @places.order(:place_price).first.place_price

    @place_choosen = @places.order(:place_price).first
    @place_select = @place_choosen.first
    @place_id = @place_choosen.first.id
    @invoiced = @price * (@date_dep - @date_arr).to_i
    @booking = Booking.new



    # @user_boat = current_user.boat_ids.first

  end

  private

  def build_markers
    @hash = Gmaps4rails.build_markers(@ports) do |port, marker|
      marker.lat port.latitude
      marker.lng port.longitude
    end
  end
end
