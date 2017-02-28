class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :nickname, presence: true
  validates :brand, presence: true
  validates :manufacturer, presence: true
  validates :immatriculation, presence: true, uniqueness: true
  validates :model, presence: true
  validates :boat_type, presence: true
  validates :length, presence: true
  validates :width, presence: true
  validates :draught, presence: true
  validates :multihull, presence: true

end
