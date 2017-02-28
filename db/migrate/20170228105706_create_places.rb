class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.decimal :place_price
      t.float :length
      t.float :width
      t.float :draught
      t.boolean :ss_elec, default: false
      t.boolean :ss_fresh_water, default: false
      t.boolean :ss_ice, default: false
      t.boolean :ss_fuel, default: false
      t.boolean :ss_tel, default: false
      t.boolean :ss_wifi, default: false
      t.boolean :ss_shower, default: false
      t.boolean :sc_waste_sorting, default: false
      t.boolean :sc_waste_pumping, default: false
      t.boolean :sc_security, default: false
      t.boolean :sc_waste_container, default: false

      t.timestamps
    end
  end
end
