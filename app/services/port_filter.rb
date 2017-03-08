class PortFilter
  attr_reader :params, :places, :ports, :cleaned_params

  def initialize(params)
    @params = params
    @ports = Port.all.left_outer_joins(places: :bookings)
  end

  def filter
    filter_by_date
    filter_by_dimensions
    filter_by_options
    @places = @ports.group('ports.id').count
    @ports = @ports.distinct
    order_by_distance
  end

  def cleaned_params
    {
      port_name: params[:port_name],
      length: params[:length],
      width: params[:width],
      draught: params[:draught],
      arrival_date: params[:arrival_date],
      departure_date: params[:departure_date]
    }
  end

  private

  def order_by_distance
    if params[:port_name].present?
      @ports = @ports.near(params[:port_name], 500)
    end
  end

  def filter_by_date
    if params[:arrival_date].present? && params[:departure_date].present?
      ad = Date.strptime(params[:arrival_date], '%d/%m/%Y')
      dd = Date.strptime(params[:departure_date], '%d/%m/%Y')
      @ports = @ports.where('places.id NOT IN (SELECT place_id FROM bookings WHERE ((arrival_date, departure_date) OVERLAPS (?, ?)))', ad, dd + 1)
    end
  end

  def filter_by_dimensions
    @ports = @ports.where(
      'places.length > ? AND places.width > ? AND places.draught > ?',
      params[:length],
      params[:width],
      params[:draught]
    )
  end

  def filter_by_options

    ap 'ss elec'

    if params[:ss_elec] == '1'
      @ports = @ports.where('places.ss_elec = ?', true)
    end

    ap @ports

    if params[:ss_ice] == '1'
      @ports = @ports.where('places.ss_ice = ?', true)
    end

    if params[:ss_fuel] == '1'
      @ports = @ports.where('places.ss_fuel = ?', true)
    end

    if params[:ss_tel] == '1'
      @ports = @ports.where('places.ss_tel = ?', true)
    end

    if params[:ss_wifi] == '1'
      @ports = @ports.where('places.ss_wifi = ?', true)
    end

    if params[:ss_shower] == '1'
      @ports = @ports.where('places.ss_shower = ?', true)
    end

    if params[:ss_waste_sorting] == '1'
      @ports = @ports.where('places.ss_waste_sorting = ?', true)
    end

    if params[:ss_waste_pumping] == '1'
      @ports = @ports.where('places.ss_waste_pumping = ?', true)
    end

    if params[:sc_waste_container] == '1'
      @ports = @ports.where('places.sc_waste_container = ?', true)
    end

    if params[:sc_security] == '1'
      @ports = @ports.where('places.sc_security = ?', true)
    end
  end
end
