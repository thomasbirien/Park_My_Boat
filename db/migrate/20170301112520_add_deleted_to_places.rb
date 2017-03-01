class AddDeletedToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :deleted_at, :datetime
    add_index :places, :deleted_at
  end
end
