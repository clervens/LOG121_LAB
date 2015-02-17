class CommandesController < InheritedResources::Base

  private

    def commande_params
      params.require(:commande).permit(:numero, :date_de_livraison, :restaurant_id)
    end
end

