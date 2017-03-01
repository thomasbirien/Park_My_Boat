class AddDeletedToPorts < ActiveRecord::Migration[5.0]
  def change
    add_column :ports, :deleted_at, :datetime
    add_index :ports, :deleted_at
  end
end
