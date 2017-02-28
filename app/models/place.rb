class Place < ApplicationRecord
  has_many :bookings
  belongs_to :port
  validates :length, presence: true
  validates :width, presence: true
  validates :draught, presence: true
  validates :place_price, presence: true


end
