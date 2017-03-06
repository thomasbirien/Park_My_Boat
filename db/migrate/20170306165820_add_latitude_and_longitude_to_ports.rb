class AddLatitudeAndLongitudeToPorts < ActiveRecord::Migration[5.0]
  def change
    add_column :ports, :latitude, :float
    add_column :ports, :longitude, :float
    remove_column :ports, :lng
    remove_column :ports, :lat
  end
end
