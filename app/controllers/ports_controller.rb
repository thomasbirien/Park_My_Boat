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

    @arrival_date = (Date.strptime(params[:arrival_date], '%d/%m/%Y'))
    @departure_date = (Date.strptime(params[:departure_date], '%d/%m/%Y'))
    @price = @places.order(:place_price).last.place_price
    @booking = Booking.new
    @invoiced = @price * (@departure_date - @arrival_date).to_i
  end

  private

  def build_markers
    @hash = Gmaps4rails.build_markers(@ports) do |port, marker|
      marker.lat port.latitude
      marker.lng port.longitude
    end
  end
end
