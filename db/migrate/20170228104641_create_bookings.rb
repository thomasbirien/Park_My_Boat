class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :arrival_date
      t.date :departure_date
      t.decimal :invoiced_price
      t.text :comment
      t.references :user, foreign_key: true
      t.references :boat, foreign_key: true

      t.timestamps
    end
  end
end
