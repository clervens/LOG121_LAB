class CarnetDeCommande
  def initialize(restaurant)
    @restaurant = restaurant
    @commandes = restaurant.commandes.where etat: Commande.etats[:prete]
  end

  def commandes
    @commandes.reload
    @commandes.clone()
  end
end