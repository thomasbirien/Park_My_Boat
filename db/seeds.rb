# seed v3

Booking.with_deleted.each(&:really_destroy!)
Boat.with_deleted.each(&:really_destroy!)
User.with_deleted.each(&:really_destroy!)
Place.with_deleted.each(&:really_destroy!)
Port.with_deleted.each(&:really_destroy!)

# Creation ports db
img_Ciotat = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120509_175345_10100-la-ciotat-240312.jpg"
img_Sete = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120510_113203_09941-sete-290212.jpg"
img_Toulon = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120510_100215_10134-toulon-240312.jpg"
img_Cannes = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120523_120713_-palais-des-festivals-et-des-congr-s-de-cannes-kelagopian-pour-la-wbor6044-.jpg"
img_Vauban_Antibe = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120510_105704_10227-antibes-240312.jpg"
img_Galere = "http://images.figaronautisme.com/image/figaro-nautisme/ports/photos/120509_182644_10195-la-galere-240312.jpg"



counter = 0
puts "Creating Ports"
5.times do
  print '.'
  counter += 1
  Port.create!(
    port_name: ["La Ciotat","Sète","Toulon Côte d'Azur", "Cannes", "Antibes-Vauban", "La Galère"][counter - 1],
    legal_entity: "Capitainerie",
    description:["Port situé dans la ville au Nord de l’ensemble portuaire. Il est composé de deux bassins séparés par un large terre-plein.", "Le port de plaisance de Sète est une escale attractive et originale. Le charme des canaux et le côté pittoresque de son Port de Pêche, font de Sète une ville de caractère, baignée à la fois par la Méditerranée et par l’Etang de Thau.", "Venez découvrir les 6 ports de plaisance de Toulon Vieille Darse, Toulon Darse Nord, La Seyne-sur-Mer, Saint-Mandrier, Saint-Louis du Mourillon et du Niel.", "Un très beau port, incontournable à l'occasion de ses nombreux festivals", "Cette merveilleuse crique naturelle est devenue sous le nom de PORT VAUBAN le plus important port de plaisance en tonnage de la Méditerranée.", "Situé à 5 M au sud-ouest de Cannes, entre la pointe de la Galère et la pointe Saint-Marc."][counter - 1],
    size: [650, 120, 100, 350, 1700, 169][counter - 1],
    picture: [img_Ciotat, img_Sete, img_Toulon, img_Cannes, img_Vauban_Antibe, img_Galere][counter - 1],
    latitude: [43.174834, 43.400949, 43.123514, 43.551362, 43.585404, 43.497095][counter - 1],
    longitude: [5.607379, 3.697938, 5.933265, 7.015613,7.127177, 6.947550][counter - 1],
    phone_number: ["04 95 09 52 60", "04 67 74 98 97", "04 94 36 37 38", "04 93 21 72 17", "04 92 91 60 00", "04 93 75 41 74"][counter - 1],
    radio_channel: ["VHF Canal 9", "VHF Canal 9", "VHF Canal 9", "VHF Canal 9", "VHF Canal 9", "VHF Canal 9"][counter - 1],
    email: ["contact@ciotat.fr", "portstclair@portsuddefrance-sete.fr", "info@toulon.fr", "contact.rivieraports@cote-azur.cci.fr","reservation@portvauban.net", "port.galere@orange.fr"][counter - 1],
    address: ["Nouveau port de plaisance, Boulevard Anatole France, 13600 La Ciotat", "Quais d'Orient, République et Moulins, 34200 Sète", "Terminal Toulon, 33 route Vincent, 13890 Toulon", "Prom. de la Pantiero, 06400 Cannes","PORT VAUBAN 06600 ANTIBES FRANCE", "Concessionnaire de Port La Galère 06590 Théoule"][counter - 1],
    check_in_hour: ["11h00", "12h00", "11h30", "11h30", "11h30", "11h30"][counter - 1],
    check_out_hour: ["12h00", "13h00", "12h00", "12h00", "12h00", "12h00"][counter - 1]
    )
end

# creation places aléatoires
6.times do
  prices = [10.00, 11.00, 11.50, 15.50, 28.00, 32.00]
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


# Creation places Ciotat
counter = 0
10.times do
  print '.'
  counter += 1
  Place.create!(
    place_price: [8.00, 8.00, 15.00, 15.00, 16.00, 18.00, 20.00, 25.00, 25.00, 30.00][counter - 1],
    length: [6.00, 6.00, 11.00, 11.00, 12.00, 12.00, 12.00, 25.00, 30.00, 35,00][counter - 1],
    width: [3.00, 3.00, 3.00, 4.00, 4.00, 4.00, 5.00, 7.00, 10.00, 14,00][counter - 1],
    draught: [2.00, 2.00, 2.00, 3.00, 4.00, 4.00, 4.00, 5.00, 6.00, 6,00][counter - 1],
    ss_elec: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    ss_fresh_water: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    ss_ice: [true, false, false, true, false, false, false, true, true, true][counter - 1],
    ss_fuel: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    ss_tel: [true, false, true, true, true, true, true, true, true, true][counter - 1],
    ss_wifi: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    ss_shower: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    sc_waste_sorting: [true, false, true, true, true, true, true, true, true, true][counter - 1],
    sc_waste_pumping: [true, false, true, true, true, true, true, true, true, true][counter - 1],
    sc_security: [true, false, true, true, true, true, true, true, true, true][counter - 1],
    sc_waste_container: [true, false, true, true, false, true, false, true, false, true][counter - 1],
    port_id: Port.find_by(port_name: "La Ciotat").id
    )
end

# places pour port de Sète
counter = 0
5.times do
  print '.'
  counter += 1

  Place.create!(
    length: [6.00, 6.00, 11.00, 11.00, 12.00][counter - 1],
    place_price: [10.00, 10.00, 30.00, 30.00, 35.00][counter - 1],
    width: [3.00, 3.00, 3.00, 4.00, 4.00][counter - 1],
    draught: [2.00, 2.00, 2.00, 3.00, 4.00][counter - 1],
    ss_elec: [true, false, true, true, false][counter - 1],
    ss_fresh_water: [true, false, true, true, false][counter - 1],
    ss_ice: [true, false, false, true, false][counter - 1],
    ss_fuel: [true, false, true, true, false][counter - 1],
    ss_tel: [true, false, true, true, true][counter - 1],
    ss_wifi: [true, false, true, true, false][counter - 1],
    ss_shower: [true, false, true, true, false][counter - 1],
    sc_waste_sorting: [true, false, true, true, true][counter - 1],
    sc_waste_pumping: [true, false, true, true, true][counter - 1],
    sc_security: [true, false, true, true, true][counter - 1],
    sc_waste_container: [true, false, true, true, false][counter - 1],
    port_id: Port.find_by(port_name: "Sète").id
    )
end

# places pour port de Cannes
counter = 0
5.times do
  print '.'
  counter += 1

  Place.create!(
    place_price: [12.00, 12.00, 35.00, 35.00, 35.00][counter - 1],
    length: [6.00, 6.00, 11.00, 11.00, 12.00][counter - 1],
    width: [3.00, 3.00, 3.00, 4.00, 4.00][counter - 1],
    draught: [2.00, 2.00, 2.00, 3.00, 4.00][counter - 1],
    ss_elec: [true, true, true, true, false][counter - 1],
    ss_fresh_water: [true, false, true, true, false][counter - 1],
    ss_ice: [true, false, true, true, false][counter - 1],
    ss_fuel: [true, false, true, true, false][counter - 1],
    ss_tel: [true, false, true, true, true][counter - 1],
    ss_wifi: [true, false, true, true, false][counter - 1],
    ss_shower: [true, false, true, true, false][counter - 1],
    sc_waste_sorting: [true, false, true, true, true][counter - 1],
    sc_waste_pumping: [true, false, true, true, true][counter - 1],
    sc_security: [true, false, true, true, true][counter - 1],
    sc_waste_container: [true, false, true, true, false][counter - 1],
    port_id: Port.find_by(port_name: "Cannes").id
    )
end

#places pour port de la Galère
counter = 0
5.times do
  print '.'
  counter += 1

  Place.create!(
    place_price: [14.00, 14.00, 36.00, 36.00, 36.00][counter - 1],
    length: [6.00, 6.00, 11.00, 11.00, 12.00][counter - 1],
    width: [3.00, 3.00, 3.00, 4.00, 4.00][counter - 1],
    draught: [2.00, 2.00, 2.00, 3.00, 4.00][counter - 1],
    ss_elec: [true, true, true, true, false][counter - 1],
    ss_fresh_water: [true, false, true, true, false][counter - 1],
    ss_ice: [true, false, true, true, false][counter - 1],
    ss_fuel: [true, false, true, true, false][counter - 1],
    ss_tel: [true, false, true, true, true][counter - 1],
    ss_wifi: [true, false, true, true, false][counter - 1],
    ss_shower: [true, false, true, true, false][counter - 1],
    sc_waste_sorting: [true, false, true, true, true][counter - 1],
    sc_waste_pumping: [true, false, true, true, true][counter - 1],
    sc_security: [true, false, true, true, true][counter - 1],
    sc_waste_container: [true, false, true, true, false][counter - 1],
    port_id: Port.find_by(port_name: "La Galère").id
    )
end


# Creation users
img_petit = "https://verygoodlord.com/wp-content/uploads/2015/07/Ernest-Hemingway-%C3%A9crivain-et-marin.jpg"
img_geraud = "http://cdn.deguisetoi.fr/images/rep_art/gra/170/2/170299/chapeau-capitaine-marin-adulte_170299_1.jpg"

counter = 0
2.times do
  counter += 1
  User.create!(
    first_name: ["Michel", "Robert"][counter - 1],
    last_name: ["Petit", "Geraud"][counter - 1],
    picture:[img_petit, img_geraud][counter - 1],
    phone_number: ["06 12 30 22 34", "07 08 09 10 34"][counter - 1],
    civility: ["M.", "M."][counter - 1],
    address: ["23 av. des ecoles", "45 rue du four"][counter - 1],
    post_code: ["69006", "75018"][counter - 1],
    city: ["Lyon", "Paris"][counter - 1],
    country: ["France", "France"][counter - 1],
    email: ["michelpetit@gmail.com", "robertgeraud@wanadoo.fr"][counter - 1],
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
    comment: ["Arriverons peut-être plus tard", "", "", ""][counter - 1],
    user_id: User.all.sample.id,
    place_id: Port.find_by(port_name: "La Ciotat").places.sample.id
    )
end

