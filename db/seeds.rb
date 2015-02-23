# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## User

User.create!({
  nom: 'Doe',
  prenom: 'John',
  telephone: ENV["Default_SMS_Number"],
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: DateTime.now
})
user = User.find_by(email: 'admin@example.com')
  user.add_role :entrepreneur
  user.add_role :restaurateur
  user.add_role :livreur
  user.add_role :client

## Restaurants

Restaurant.create!([{
  nom: "Noma",
  adresse: "Copenhague, Danemark"
}, {
  nom: "Eleven Madison Park",
  adresse: "New York, USA"
}, {
  nom: "Bouillon Bilk",
  adresse: "1595 Boul Saint-Laurent, Montréal, Québec H2X 2S9, Canada"
}])

## Menus et Plats

Menu.create!([{
  nom: "Spéciaux",
  restaurant_id: 1,
  plats_attributes: [{
      nom: "McDouble Xtrem Plus",
      description: "S.O.",
      prix: "6.0",
    }, {
      nom: "Bob Burger",
      description: "S.O.",
      prix: "5.0",
    }],
  }, {
  nom: "Le menu festin",
  restaurant_id: 2,
  plats_attributes: [{
      nom: "McDouble Xtrem Plus",
      description: "S.O.",
      prix: "3.75",
    }, {
      nom: "Sushi",
      description: "S.O.",
      prix: "8.25",
    }],
}])

## Adresses

[
  "1100 rue Notre-Dame Ouest, Montréal, QC H3C 1K3",
  "1111 rue Notre-Dame Ouest, Montréal, QC H3C 6M8",
  "1909 Avenue des Canadiens-de-Montréal, Montréal, QC H4B 5G0",
  "845 Rue Sherbrooke O, Montréal, QC H3A 0G4",
  "4777 Avenue Pierre-de Coubertin, Montréal, QC H1V 1B3"
].each do |address|
  Adresse.create!(value: address, user_id: 1)
end

## Commandes

Commande.create!([{
    date_de_livraison: 1.hour.from_now,
    restaurant_id: 1,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 70, plat_id: 1}]
  }, {
    date_de_livraison: 3.hour.from_now,
    restaurant_id: 1,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 2, plat_id: 1}, {qte: 1, plat_id: 2}]
  }, {
    date_de_livraison: 4.days.from_now,
    restaurant_id: 1,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 3, plat_id: 1}, {qte: 5, plat_id: 2}, {qte: 8, plat_id: 3}, {qte: 14, plat_id: 4}]
}])