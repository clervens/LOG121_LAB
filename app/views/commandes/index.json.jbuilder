if params[:cached].present?
  json.cache! [@commandes, params[:cached]], expires_in: 10.minutes do
    json.array!(@commandes) do |commande|
      json.extract! commande, :id, :numero, :date_de_livraison, :adresse, :restaurant_id, :ligne_commandes
      json.url commande_url(commande, format: :json)
    end
  end
else
  json.array!(@commandes) do |commande|
    json.extract! commande, :id, :numero, :date_de_livraison, :adresse, :restaurant_id, :ligne_commandes
    json.url commande_url(commande, format: :json)
  end
end
