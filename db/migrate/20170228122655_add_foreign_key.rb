class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :place, index: true
    add_reference :places, :port, index: true
  end
end
