json.array!(@commandes) do |commande|
  json.extract! commande, :id, :numero, :date_de_livraison, :restaurant_id
  json.url commande_url(commande, format: :json)
end
