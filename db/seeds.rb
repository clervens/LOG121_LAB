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

[:entrepreneur, :restaurateur, :livreur, :client].each do |role|
  n = User.new({
    nom: role.capitalize,
    prenom: 'LOGTI',
    telephone: ENV["Default_SMS_Number"],
    email: "#{role.to_s}@example.com",
    password: 'password',
    password_confirmation: 'password',
    confirmed_at: DateTime.now
  })
  n.add_role role
  n.save!
  user.add_role role
end

## Restaurants

Restaurant.create!([{
  nom: "Noma",
  adresse: "200 Rue Beaubien Est, Montréal, QC H2S 1R4"
}, {
  nom: "Europea",
  adresse: "1227 Rue de la Montagne, Montréal, QC H3G 1Z2"
}, {
  nom: "Bouillon Bilk",
  adresse: "1595 Boul Saint-Laurent, Montréal, Québec H2X 2S9, Canada"
}, {
  nom: "Evy ting Wong![TEST]",
  adresse: "8335 Boul Langelier, Montréal, QC H1P 2B8"
}])

## Menus et Plats

Menu.create!([{
  nom: "Spéciaux",
  restaurant_id: 1,
  plats_attributes: [{
      nom: "McDouble Xtrem Plus",
      description: "S.O.",
      prix: "6.0"
    }, {
      nom: "Bob Burger",
      description: "S.O.",
      prix: "5.0"
    }],
  }, {
  nom: "Soir",
  restaurant_id: 3,
  plats_attributes: [{
      nom: "Hamachi",
      description: "S.O.",
      prix: "16.25"
    }, {
      nom: "Assortiment de fromages québécois",
      description: "S.O.",
      prix: "20.0"
    }],
  }, {
  nom: "Menu dégustation signature",
  restaurant_id: 2,
  plats_attributes: [{
      nom: "Risotto",
      description: "Risotto crémeux mascarpone et burrata. Poêlée de champignons et asperges de saison. Mousseline de petits pois et vrilles.
Oeuf en coquille de béarnaise et crumble",
      prix: "23.50"
    }, {
      nom: "Calamar",
      description: "Calamar citronné et structuré en tagliatelles. OEuf de caille poché, croutons d’encre de seiche au beurre à l’ail",
      prix: "23.50"
    }, {
      nom: "Cerf",
      description: "Tartare de cerf boucané sous cloche. Pommes allumettes et croutons au wasabi. Réduction de carminé du Québec
et vieux cheddar. Émulsion de moutarde",
      prix: "25.50"
    }, {
      nom: "Fruits de Mer",
      description: "Calamar citronné et structuré en tagliatelles. OEuf de caille poché, croutons d’encre de seiche au beurre à l’ail",
      prix: "26.50"
    }],
}])

menu = { nom: "BIG @$$ Menu", restaurant_id: 4, plats_attributes: [] }
5000.times do |index|
  nom = ('a'..'z').to_a.sample(10).join
  description = ('a'..'z').to_a.sample(30).join
  prix = (rand(100)+rand).round 2
  menu[:plats_attributes] << { nom: nom, description: description, prix: prix }
end

## Adresses

[
  "1100 rue Notre-Dame Ouest, Montréal, QC H3C 1K3",
  "1111 rue Notre-Dame Ouest, Montréal, QC H3C 6M8",
  "1909 Avenue des Canadiens-de-Montréal, Montréal, QC H4B 5G0",
  "845 Rue Sherbrooke O, Montréal, QC H3A 0G4"
].each do |address|
  Adresse.create!(value: address, user_id: 1)
end

User.all.each do |user|
  Adresse.create! value: "4777 Avenue Pierre-de Coubertin, Montréal, QC H1V 1B3", user_id: user
end

## Commandes
ENV['SKIP_SMS'] = 'true'

Commande.create!([{
    date_de_livraison: 1.hour.from_now,
    restaurant_id: 1,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 70, plat_id: 1}],
    user_id: 1,
    etat: Commande.etats[:paye]
  }, {
    date_de_livraison: 3.hour.from_now,
    restaurant_id: 2,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 2, plat_id: 5}, {qte: 1, plat_id: 6}],
    user_id: 1,
    etat: Commande.etats[:paye]
  }, {
    date_de_livraison: 4.days.from_now,
    restaurant_id: 3,
    adresse_id: 1,
    ligne_commandes_attributes: [{qte: 3, plat_id: 3}, {qte: 5, plat_id: 4}],
    user_id: 1,
    etat: Commande.etats[:prete]
}])
