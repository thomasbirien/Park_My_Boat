class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index

    @target = {
      port_name: params[:port_name],
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date]
    }

    filter_ports

    @ports = Port.all
    # @ports = @ports.near(Port.where("port_name ILIKE ?", "%#{params[:port_name]}%"), 20)
    # @ports = (Port.where("port_name ILIKE ?", "%#{params[:port_name]}%"))
    # @ports_selected = Port.all
    # @ports_selected = @ports_selected.joins(:places).where("places.length > ? AND places.width > ? AND places.draught > ?", params[:length], params[:width], params[:draught])
    # @ports_selected = @ports_selected.joins(:bookings).where("bookings.arrival_date > ? AND bookings.departure_date >= ?", Date.strptime(params[:departure_date], "%m/%d/%Y"), Date.strptime(params[:arrival_date], "%m/%d/%Y"))
    # @ports_selected = @ports_selected.joins(:bookings).select {|port| port.places.available_at(@date_range)}

    @ports = Port.where.not(lat: nil, lng: nil)

    @hash = Gmaps4rails.build_markers(@ports_selected) do |port, marker|
      marker.lat port.lat
      marker.lng port.lng
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end


def filter_ports

  @date_range = (Date.strptime(params[:arrival_date], '%m/%d/%Y'))..(Date.strptime(params[:departure_date], '%m/%d/%Y'))
  @input_arrival_date = Date.strptime(params[:arrival_date], '%m/%d/%Y')
  @input_departure_date = Date.strptime(params[:departure_date], '%m/%d/%Y')

  @places_selected = Place.all
  @places_selected = @places_selected.where("places.length > ? AND places.width > ? AND places.draught > ?", params[:length], params[:width], params[:draught])
  @places_selected = @places_selected.select {|place| place.available_at(@date_range)}

  @ports_selected = @places_selected.map do |place|
    place.port
  end.uniq

end



end
