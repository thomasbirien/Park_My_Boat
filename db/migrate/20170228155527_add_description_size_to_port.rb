class AddDescriptionSizeToPort < ActiveRecord::Migration[5.0]
  def change
    add_column :ports, :description, :text
    add_column :ports, :size, :integer
  end
end
