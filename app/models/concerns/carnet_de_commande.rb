class CarnetDeCommande
  def initialize(restaurant)
    @restaurant = restaurant
    # Faire un scope pour ne retourner que
    # les commandes qui ne sont pas encore livrée
    @commandes = restaurant.commandes.where("date_de_livraison > ?", 20.days.ago)
  end

  def commandes
    @commandes.reload
    @commandes.clone()
  end
end