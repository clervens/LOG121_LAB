class LivraisonsController < ApplicationResourcesController

  belongs_to :restaurant

  def create
    create! do |success, failure|
      success.html { redirect_to pretes_commandes_url, notice: "La livraison à été créée" }
      failure.html { redirect_to pretes_commandes_url, alert: @livraison.errors.full_messages.join(", ") }
    end
  end

  private

    def livraison_params
      params.require(:livraison).permit(:commande_id, :user_id, :adresse)
    end
end

