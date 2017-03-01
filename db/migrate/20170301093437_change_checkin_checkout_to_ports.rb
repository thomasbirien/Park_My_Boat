class ChangeCheckinCheckoutToPorts < ActiveRecord::Migration[5.0]
  def change
    change_column :ports, :check_in_hour, :string
    change_column :ports, :check_out_hour, :string
  end
end
