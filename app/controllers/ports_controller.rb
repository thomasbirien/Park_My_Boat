class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index

    @target = {
      port_name: params[:port_name],
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date]
    }


    @date_range = (Date.strptime(params[:arrival_date], '%m/%d/%Y'))+1.days..(Date.strptime(params[:departure_date], '%m/%d/%Y'))-1.days


    @ports = Port.all
    # @ports = (Port.where("port_name ILIKE ?", "%#{params[:port_name]}%"))
    # @ports_selected = Port.all
    # @ports_selected = @ports_selected.joins(:places).where("places.length > ? AND places.width > ? AND places.draught > ?", params[:length], params[:width], params[:draught])
    # @ports_selected = @ports_selected.joins(:bookings).where("bookings.arrival_date > ? AND bookings.departure_date >= ?", Date.strptime(params[:departure_date], "%m/%d/%Y"), Date.strptime(params[:arrival_date], "%m/%d/%Y"))
    # @ports_selected = @ports_selected.joins(:bookings).select {|port| port.places.available_at(@date_range)}

@places_selected = Place.all
@places_selected = @places_selected.where("places.length > ? AND places.width > ? AND places.draught > ?", params[:length], params[:width], params[:draught])
@places_selected = @places_selected.select {|place| place.available_at(@date_range)}

@ports_selected = @places_selected.map do |place|
  place.port
end.uniq


    # @ports = Port.where.not(lat: nil, lng: nil)

    @hash = Gmaps4rails.build_markers(@ports) do |port, marker|
      marker.lat port.lat
      marker.lng port.lng
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end


  def show

    @port = Port.find(params[:id])
    @arrival_date = params[:arrival_date]
    @departure_date = params[:departure_date]
    @booking = Booking.new
  end




end
