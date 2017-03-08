class Port < ApplicationRecord
  acts_as_paranoid

  has_many :places
  has_many :bookings, through: :places

  validates :port_name, presence: true
  validates :legal_entity, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :phone_number, presence: true
  validates :radio_channel, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :check_in_hour, presence: true
  validates :check_out_hour, presence: true

  reverse_geocoded_by :latitude, :longitude

  def self.has_places_between(dates)
    # todo
  end

  def place_minimum_price
    places.minimum(:place_price)
  end

end
