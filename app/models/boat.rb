class Boat < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates_presence_of :nickname, :brand, :manufacturer, :immatriculation, :boat_type, :length, :width, :draught
  validates :immatriculation, uniqueness: true
end
