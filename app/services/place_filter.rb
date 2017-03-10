class PlaceFilter
  attr_reader :places, :params

  def initialize(params)
    @params = params
    @places = Place.where(port_id: params[:id]).left_outer_joins(:bookings)
  end

  def filter

    filter_by_date
    filter_by_dimensions
    filter_by_options
  end

  private

  def filter_by_date
    if params[:arrival_date].present? && params[:departure_date].present?
      ad = Date.strptime(params[:arrival_date], '%d/%m/%Y')
      dd = Date.strptime(params[:departure_date], '%d/%m/%Y')
      @places = @places.where('places.id NOT IN (SELECT place_id FROM bookings WHERE ((arrival_date, departure_date) OVERLAPS (?, ?)))', ad, dd + 1)

    end
  end

  def filter_by_dimensions

    @places = @places.where(
      'length > ? AND width > ? AND draught > ?',
      params[:length],
      params[:width],
      params[:draught]
    )

  end

  def filter_by_options

    if params[:ss_elec] == '1'
      @places = @places.where(ss_elec: true)
    end

    if params[:ss_ice] == '1'
      @places = @places.where(ss_ice: true)
    end

    if params[:ss_fuel] == '1'
      @places = @places.where(ss_fuel: true)
    end

    if params[:ss_tel] == '1'
      @places = @places.where(ss_tel: true)
    end

    if params[:ss_wifi] == '1'
      @places = @places.where(ss_wifi: true)
    end

    if params[:ss_shower] == '1'
      @places = @places.where(ss_shower: true)
    end

    if params[:sc_waste_sorting] == '1'
      @places = @places.where(sc_waste_sorting: true)
    end

    if params[:sc_waste_pumping] == '1'
      @places = @places.where(sc_waste_pumping: true)
    end

    if params[:sc_waste_container] == '1'
      @places = @places.where(sc_waste_container: true)
    end

    if params[:sc_security] == '1'
      @places = @places.where(sc_security: true)
    end

  end
end
