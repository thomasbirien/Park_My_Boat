class AddDeletedToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :deleted_at, :datetime
    add_index :boats, :deleted_at
  end
end
