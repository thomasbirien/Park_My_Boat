class Place < ApplicationRecord
  acts_as_paranoid
  has_many :bookings
  belongs_to :port
  validates :length, presence: true
  validates :width, presence: true
  validates :draught, presence: true
  validates :place_price, presence: true

  def available_at(date_range)
  # implentation of date not done
    available = true
      self.bookings.each do |booking|
        if @input_departure_date == booking.arrival_date && (((booking.arrival_date..booking.departure_date).to_a & @date_range.to_a).count == 1)
          available = true
        elsif @input_arrival_date == booking.arrival_date && (((booking.arrival_date..booking.departure_date).to_a & @date_range.to_a).count == 1)
          available = true
        elsif ((booking.arrival_date..booking.departure_date).to_a & @date_range.to_a)
        available = false
        end
      end
    available
  end
end
