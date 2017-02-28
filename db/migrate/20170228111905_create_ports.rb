class CreatePorts < ActiveRecord::Migration[5.0]
  def change
    create_table :ports do |t|
      t.string :port_name
      t.string :legal_entity
      t.string :picture
      t.decimal :lng
      t.decimal :lat
      t.string :phone_number
      t.string :radio_channel
      t.string :email
      t.string :address
      t.time :check_in_hour
      t.time :check_out_hour

      t.timestamps
    end
  end
end
