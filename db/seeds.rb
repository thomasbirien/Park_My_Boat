#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Boat.destroy_all
User.destroy_all
Place.destroy_all
Port.destroy_all


# Creation ports db
img_Ciotat = "https://www.google.fr/maps/uv?hl=fr&pb=!1s0x12c9af74c107837d:0x17b933ed8fdd8bdc!2m19!2m2!1i80!2i80!3m1!2i20!16m13!1b1!2m2!1m1!1e1!2m2!1m1!1e3!2m2!1m1!1e5!2m2!1m1!1e4!3m1!7e115!4s//geo0.ggpht.com/cbk?panoid%3DvTpXFKsIm-xJjjB_3N1qAQ%26output%3Dthumbnail%26cb_client%3Dsearch.LOCAL_UNIVERSAL.gps%26thumb%3D2%26w%3D130%26h%3D87%26yaw%3D160.1153%26pitch%3D0%26thumbfov%3D100!5s+-+Recherche+Google&imagekey=!1e2!2svTpXFKsIm-xJjjB_3N1qAQ"
img_EPR = "https://www.google.fr/maps/uv?hl=fr&pb=!1s0x12b135a5814d4e2f:0x9add15a78db0815e!2m19!2m2!1i80!2i80!3m1!2i20!16m13!1b1!2m2!1m1!1e1!2m2!1m1!1e3!2m2!1m1!1e5!2m2!1m1!1e4!3m1!7e115!4shttps://picasaweb.google.com/lh/sredir?uname%3D103566494699777456453%26id%3D6303403799543644178%26target%3DPHOTO!5s+-+Recherche+Google&imagekey=!1e3!2s-ch90HfTczEQ/V3owW9ulgBI/AAAAAAAALEA/sEYttDrPAL8xs0QqZ5GUvqDsMxLsYB7GACJkC"
img_Toulon = "https://www.google.fr/maps/uv?hl=fr&pb=!1s0x12c91b7378bb7b91:0xcd13ec5eeb62916f!2m19!2m2!1i80!2i80!3m1!2i20!16m13!1b1!2m2!1m1!1e1!2m2!1m1!1e3!2m2!1m1!1e5!2m2!1m1!1e4!3m1!7e115!4shttps://picasaweb.google.com/lh/sredir?uname%3D117508487891567250042%26id%3D6248047240903988498%26target%3DPHOTO!5s+-+Recherche+Google&imagekey=!1e3!2s-s67nvzm3Ay0/VrWF3K3xFRI/AAAAAAAAQvE/cjmCnCHpt18pFLEJC7SLXAk5ifOhR2IaQCJkC"


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
    lng: [43.174834, 43.400949, 43.123514][counter - 1],
    lat: [5.607379, 3.697938, 5.933265][counter - 1],
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
    boat_id: Boat.all.sample.id,
    place_id: Place.all.sample.id
    )
end

