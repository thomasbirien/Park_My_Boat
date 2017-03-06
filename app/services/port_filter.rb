class PortFilter
  attr_reader :params, :places, :ports

  def initialize(params)
    @params = params
    @ports = Port.all.joins(:places)
  end

  def filter
    filter_by_date
    filter_by_dimensions
    filter_by_options
    @places = @ports.group('ports.id').count
    @ports = @ports.distinct
  end

  private

  def filter_by_date
    # Person.includes(:friends).where( :friends => { :person_id => nil } )
    # Place.joins(:bookings).where()
    # places = Place.joins(:bookings).where('places.id NOT IN (SELECT DISTINCT(person_id) FROM friends)')
    # @ports = @ports.
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
    if params[:ss_elec] == '1'
      @ports = @ports.where('places.ss_elec = ?', true)
    end

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
