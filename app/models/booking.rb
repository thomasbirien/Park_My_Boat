class Booking < ApplicationRecord
  acts_as_paranoid

  before_validation :set_invoiced_price

  belongs_to :user
  belongs_to :place


  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :invoiced_price, presence: true
  validates :arrival_date, :departure_date, overlap: {
  scope:"place_id",
  message_title: "Error",
  message_content: "Impossible to booking this place for this date"
  }




  private

  def set_invoiced_price
    self.invoiced_price = place.place_price * number_of_days
  end

  def number_of_days
    (departure_date - arrival_date).to_i
  end
end
