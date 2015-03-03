class CommandesController < ApplicationResourcesController
  def create
    @commande = current_user.commandes.build commande_params
    super
  end

  private

    def commande_params
      params.require(:commande).permit({ligne_commandes_attributes: [:id, :qte, :plat_id, :_destroy]}, :numero, :date_de_livraison, :restaurant_id, :adresse_id, :etat)
    end
end

