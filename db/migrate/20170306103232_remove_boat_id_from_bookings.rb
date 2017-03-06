class RemoveBoatIdFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:bookings, :boat, index: true)
  end
end
