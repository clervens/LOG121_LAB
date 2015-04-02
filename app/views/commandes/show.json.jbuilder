if params[:cached].present?
  json.cache! [@commande, params[:cached]], expires_in: 10.minutes do
    json.extract! @commande, :id, :numero, :date_de_livraison, :restaurant_id, :created_at, :updated_at
  end
else 
  json.extract! @commande, :id, :numero, :date_de_livraison, :restaurant_id, :created_at, :updated_at
end