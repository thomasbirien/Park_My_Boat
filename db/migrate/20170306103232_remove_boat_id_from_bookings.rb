class RemoveBoatIdFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :boat_id, :integer
  end
end
