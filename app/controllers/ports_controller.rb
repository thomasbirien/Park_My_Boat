class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index

    @target = {
      port_name: params[:port_name],
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date],
    }

    @date_range = (Date.strptime(params[:arrival_date], '%d/%m/%Y'))..(Date.strptime(params[:departure_date], '%d/%m/%Y'))
    @places_selected = Place.all
    @places_selected = @places_selected.where("places.length > ? AND places.width > ? AND places.draught > ?", params[:length], params[:width], params[:draught])

  # check options one by one
  if params[:ss_elec] == '1'
    @places_selected = @places_selected.where('ss_elec = ?', true)
  end

  if params[:ss_ice] == '1'
    @places_selected = @places_selected.where('ss_ice = ?', true)
  end

  if params[:ss_fuel] == '1'
    @places_selected = @places_selected.where('ss_fuel = ?', true)
  end

  if params[:ss_tel] == '1'
    @places_selected = @places_selected.where('ss_tel = ?', true)
  end

  if params[:ss_wifi] == '1'
    @places_selected = @places_selected.where('ss_wifi = ?', true)
  end

  if params[:ss_shower] == '1'
    @places_selected = @places_selected.where('ss_shower = ?', true)
  end

  if params[:ss_waste_sorting] == '1'
    @places_selected = @places_selected.where('ss_waste_sorting = ?', true)
  end

  if params[:ss_waste_pumping] == '1'
    @places_selected = @places_selected.where('ss_waste_pumping = ?', true)
  end

  if params[:sc_waste_container] == '1'
    @places_selected = @places_selected.where('sc_waste_container = ?', true)
  end

  if params[:sc_security] == '1'
    @places_selected = @places_selected.where('sc_security = ?', true)
  end

  @places_selected = @places_selected.select {|place| place.available_at(@date_range)}

  @ports_selected = @places_selected.map do |place|
    place.port
  end.uniq



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

  # @date_range = (Date.strptime(params[:arrival_date], '%d/%m/%Y'))..(Date.strptime(params[:departure_date], '%d/%m/%Y'))
  # @input_arrival_date = Date.strptime(params[:arrival_date], '%d/%m/%Y')
  # @input_departure_date = Date.strptime(params[:departure_date], '%d/%m/%Y')

  end

  def show

    @port = Port.find(params[:id])
    @arrival_date = (Date.strptime(params[:arrival_date], '%m/%d/%Y'))
    @departure_date = (Date.strptime(params[:departure_date], '%m/%d/%Y'))
    @price = @port.places.order(:place_price).last.place_price
    @booking = Booking.new
    @invoiced = @price * (@departure_date - @arrival_date).to_i
    # @user_boat = current_user.boat_ids.first
  end







