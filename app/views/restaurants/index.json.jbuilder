json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :nom, :adresse, :restaurateur
  json.url restaurant_url(restaurant, format: :json)
end
