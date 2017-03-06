module PortsHelper
  def count_port_matching_places(port_id, places)
    port_places = places.keep_if do |place|
      place.port.id == port_id
    end
    port_places.size
  end
end
