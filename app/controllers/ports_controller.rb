class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # display only port with places > 1
    # @ports = Port.all.select { |port| port.places.count >= 1 }
    # display target port
    @target = {
      port_name: params[:port_name],
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date]
    }

    @date_range = (Date.strptime(params[:arrival_date], '%m/%d/%Y')..Date.strptime(params[:departure_date], '%m/%d/%Y'))


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

binding.pry

#need to set value if places.booking do not exist or is nil present blank

# SELECT * FROM users WHERE name = 'Joe' AND email = 'joe@example.com';


      # Port.all.each do |port|
      #   port.places.each do |place|
      #     unless @ports_selected.include? port
      #       if place.length >= params[:length].to_f
      #         @ports_selected << port
      #       else
      #         return
      #       end
      #     end
      #   end
      # end

    # @ports = Port.where( "port_name = 'params[:port_name]'")
    # @ports = Port.where( "port_name = ?" )
    # @ports = Port.where( "port_name = ?" )
    # @ports = Port.where( "port_name = '@target[:port_name'")
    # @ports = Port.where( "port_name = port_name: @target[:port_name]")

    # @ports = Port.where.not(lat: nil, lng: nil)

    @hash = Gmaps4rails.build_markers(@ports) do |port, marker|
      marker.lat port.lat
      marker.lng port.lng
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end
end
