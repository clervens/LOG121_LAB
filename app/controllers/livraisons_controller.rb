class LivraisonsController < ApplicationResourcesController
  belongs_to :restaurant

  def create
    # @livraison = current_user.livraisons.build
    super
  end

  private

    def livraison_params
      params.require(:livraison).permit(:commande_id, :user_id, :adresse)
    end
end

