class CarnetDeCommande
  ETATS = [Commande.etats[:prete], Commande.etats[:en_preparation], Commande.etats[:paye]]
  def initialize(restaurant, ids: nil)
    @restaurant = restaurant
    @commandes = if @restaurant.present?
      restaurant.commandes.where etat: ETATS
    else
      Commande.where etat: ETATS, id: ids
    end
  end

  def commandes
    @commandes.reload
    @commandes.clone()
  end

  def self.label_class(etat)
    labels = {
      Commande.etats[:prete] => 'success',
      Commande.etats[:paye] => 'info',
      Commande.etats[:en_preparation] => 'primary'
    }
    labels[Commande.etats[etat.to_sym]]
  end
end