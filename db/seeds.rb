#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


# Creation ports db
zero = 0
counter = zero += 1

10.times do
  port = Port.new(
    port_name: ,
    legal_entity:,
    description:,
    port_size:,
    picture:,
    lng:,
    lat:,
    phone_number:,
    radio_channel:,
    email:,
    address:,
    check_in_hour:,
    check_out_hour:
    )
end

# Creation places db
400.times do
  place = Place.new(
    place_price:,
    length:,
    width:,
    draught:,
    ss_elec:,
    ss_fresh_water:,
    ss_ice:,
    ss_fuel:,
    ss_tel:,
    ss_wifi:,
    ss_shower:,
    sc_waste_sorting:,
    sc_waste_pumping:,
    sc_security:,
    sc_waste_container:,
    port: Port.all.sample
    )
end

# Creation users
5.times do
  user = User.new(
    first_name:,
    last_name:,
    picture:,
    phone_number:,
    civility:,
    address:,
    post_code:,
    city:,
    country:,
    email:,
    encrypted_password:,
    )
end

# Creation boats
7.times do
  boat = Boat.new(
    brand:,
    manufacturer:,
    nickname:,
    immatriculation:,
    model:,
    boat_type:,
    length:,
    width:,
    draught:,
    multihull:,
    user:
    )
end

# Creation bookings
30.times do
  booking = Booking.new(
    arrival_date:,
    departure_date:,
    invoiced_price:,
    comment:,
    user:User.all.sample,
    boat:User.boat.sample,
    place: Place.all.sample
    )
end

