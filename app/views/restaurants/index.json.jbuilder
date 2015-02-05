json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :nom, :adresse
  json.url restaurant_url(restaurant, format: :json)
end
