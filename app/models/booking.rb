class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :boat
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :invoiced_price, presence: true
end
