class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @ports = Port.all

    @ports = Port.where.not(lat: nil, lng: nil)

    @hash = Gmaps4rails.build_markers(@ports) do |port, marker|
      marker.lat port.lat
      marker.lng port.lng
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

end
