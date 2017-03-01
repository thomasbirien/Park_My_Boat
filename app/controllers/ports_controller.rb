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
      draught: params[:draught]
    }

    @ports = (Port.where("port_name ILIKE ?", "%#{params[:port_name]}%"))
    @ports_selected = []

      Port.all.each do |port|
        port.places.each do |place|
          unless @ports_selected.include? port
            if place.length >= params[:length].to_f
              @ports_selected << port
            else
              return
            end
          end
        end
      end



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
