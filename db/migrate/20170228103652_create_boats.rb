class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :brand
      t.string :manufacturer
      t.string :nickname
      t.string :immatriculation
      t.string :model
      t.string :boat_type
      t.float :length
      t.float :width
      t.float :draught
      t.boolean :multihull, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end



