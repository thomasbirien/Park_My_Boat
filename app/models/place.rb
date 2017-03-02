class Place < ApplicationRecord
  acts_as_paranoid
  has_many :bookings
  belongs_to :port
  validates :length, presence: true
  validates :width, presence: true
  validates :draught, presence: true
  validates :place_price, presence: true

  def available_at(date_range)
    available = true
      self.bookings.each do |booking|

        available = false if ((booking.arrival_date..booking.departure_date).to_a & @date_range.to_a)
      end
    available
  end
end
