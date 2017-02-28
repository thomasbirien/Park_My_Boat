class PortsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def index
    @ports = Port.all
  end

end



