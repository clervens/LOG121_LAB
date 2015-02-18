class CommandesController < InheritedResources::Base

  private

    def commande_params
      params.require(:commande).permit({ligne_commandes_attributes: [:qte, :plat_id]}, :numero, :date_de_livraison, :restaurant_id)
    end
end

