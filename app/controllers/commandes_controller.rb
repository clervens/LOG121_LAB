class CommandesController < ApplicationResourcesController
  after_action :send_mail, only: :create
  def create
    @commande = current_user.commandes.build commande_params
    super
  end

  private

    def commande_params
      params.require(:commande).permit({adresse_attributes: [:value]},{ligne_commandes_attributes: [:id, :qte, :plat_id, :_destroy]}, :numero, :date_de_livraison, :restaurant_id, :adresse_id, :etat)
    end

    def send_mail
      CommandeMailer.confirmation(@commande).deliver
    end
end

