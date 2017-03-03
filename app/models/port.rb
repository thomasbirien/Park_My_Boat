class Port < ApplicationRecord
  acts_as_paranoid

  has_many :places
  has_many :bookings, through: :places

  validates :port_name, presence: true
  validates :legal_entity, presence: true
  validates :lng, presence: true
  validates :lat, presence: true
  validates :phone_number, presence: true
  validates :radio_channel, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :check_in_hour, presence: true
  validates :check_out_hour, presence: true
end
