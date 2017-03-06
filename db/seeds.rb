#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.with_deleted.each(&:really_destroy!)
Boat.with_deleted.each(&:really_destroy!)
User.with_deleted.each(&:really_destroy!)
Place.with_deleted.each(&:really_destroy!)
Port.with_deleted.each(&:really_destroy!)

# Creation ports db
img_Ciotat = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120509_175212_10100-la-ciotat-240312.jpg"
img_EPR = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120510_113108_09943-sete-290212.jpg"
img_Toulon = "http://www.toulon.fr/sites/new.toulon.fr/files/styles/full/public/lvs_bleumediterranee_port_011.jpg?itok=SL9f5U05"


counter = 0
puts "Creating Ports"
3.times do
  print '.'
  counter += 1
  Port.create!(
    port_name: ["La Ciotat","EPR Port Sud de France","Terminal de Toulon Côte d'Azur"][counter - 1],
    legal_entity: "Capitainerie",
    description:["Port situé dans la ville au Nord de l’ensemble portuaire. Il est composé de deux bassins séparés par un large terre-plein.", "Le port de plaisance de Sète est une escale attractive et originale. Le charme des canaux et le côté pittoresque de son Port de Pêche, font de Sète une ville de caractère, baignée à la fois par la Méditerranée et par l’Etang de Thau.", "Venez découvrir les 6 ports de plaisance de Toulon Vieille Darse, Toulon Darse Nord, La Seyne-sur-Mer, Saint-Mandrier, Saint-Louis du Mourillon et du Niel."][counter - 1],
    size: [650, 120, 100][counter - 1],
    picture: [img_Ciotat, img_EPR, img_Toulon][counter - 1],
    latitude: [43.174834, 43.400949, 43.123514][counter - 1],
    longitude: [5.607379, 3.697938, 5.933265][counter - 1],
    phone_number: ["04 95 09 52 60", "04 67 74 98 97", "04 94 36 37 38"][counter - 1],
    radio_channel: ["103.9", "102.1", "90.9"][counter - 1],
    email: ["contact@ciotat.fr", "info@ERP.com", "info@toulon.fr"][counter - 1],
    address: ["Nouveau port de plaisance, Boulevard Anatole France, 13600 La Ciotat", "ERP, 3 rue Bernard, 13720 Sète", "Terminal Toulon, 33 route Vincent, 13890 Toulon"][counter - 1],
    check_in_hour: ["11h00", "12h00", "11h30"][counter - 1],
    check_out_hour: ["12h00", "13h00", "12h00"][counter - 1]
  )
end

# Creation places db
6.times do
  prices = [20.5, 30.10, 50.00, 100.15, 120.00, 99.99]
  lengths = [10.35, 15.50, 25.35, 9.90, 20.10]
  widths = [4.3, 6.2, 3.45, 7.3]
  draughts = [2.45, 3.5, 1.5]
  boolean = [true, false]
  Place.create!(
    place_price: prices.sample,
    length: lengths.sample,
    width: widths.sample,
    draught: draughts.sample,
    ss_elec: boolean.sample,
    ss_fresh_water: boolean.sample,
    ss_ice: boolean.sample,
    ss_fuel: boolean.sample,
    ss_tel: boolean.sample,
    ss_wifi: boolean.sample,
    ss_shower: boolean.sample,
    sc_waste_sorting: boolean.sample,
    sc_waste_pumping: boolean.sample,
    sc_security: boolean.sample,
    sc_waste_container: boolean.sample,
    port_id: Port.all.sample.id
    )
end

# Creation users
img_georgette = "http://www.inmemoriam.ca/images/photo_original/340777-georgette-belair.jpg"
img_arnold = "http://assets.schwarzenegger.com/images/img-2.jpg"

counter = 0
2.times do
  counter += 1
  User.create!(
    first_name: ["Georgette", "Arnold"][counter - 1],
    last_name: ["Bichon", "Schwarzi"][counter - 1],
    picture:[img_georgette, img_arnold][counter - 1],
    phone_number: ["06 12 30 22 34", "07 08 09 10 34"][counter - 1],
    civility: ["Grande Bretonne", "Roumain"][counter - 1],
    address: ["23 av. de l'amour de dieu", "45 rue du biscoto"][counter - 1],
    post_code: ["34006", "23004"][counter - 1],
    city: ["Los Angeles", "Texas"][counter - 1],
    country: ["Earth", "US"][counter - 1],
    email: ["georgette@gmail.com", "arnold@wanadoo.fr"][counter - 1],
    password: "password"
    )
end

# Creation boats
counter = 0
3.times do
  lengths = [9.35, 15.50, 23.35, 9.10, 20.10]
  widths = [4.3, 6.2, 3.45, 7.3]
  draughts = [2.45, 4.5, 1.5]
  boolean = [true, false]
  counter += 1
  Boat.create!(
    brand: ["Nitro", "Triton", "Cobalt Boats"][counter - 1],
    manufacturer: ["Sailboats", "Cabin Cruisers", " M series"][counter - 1],
    nickname: ["Calypso", "BatO", "Titanic"][counter - 1],
    immatriculation: ["23WW356", "90SJ235", "89ZL365"][counter - 1],
    model: ["XMSS3", "ZK34N", "ZEP34"][counter - 1],
    boat_type: ["Voilier", "Moteur", "Voilier"][counter - 1],
    length: lengths.sample,
    width: widths.sample,
    draught: draughts.sample,
    multihull: [false, false, true][counter - 1],
    user_id: User.all.sample.id
    )
end

# Creation bookings
counter = 0
4.times do
  counter += 1
  Booking.create!(
    arrival_date:["13/03/2017", "16/03/2017", "23/03/2017", "28/03/2017"][counter - 1],
    departure_date:["15/03/2017", "20/03/2017", "27/03/2017", "01/04/2017"][counter - 1],
    comment: ["J'ai le mal de mer", "I will be back", "J'aime les bulots", "Vive les moules"][counter - 1],
    user_id: User.all.sample.id,
    place_id: Place.all.sample.id
    )
end

