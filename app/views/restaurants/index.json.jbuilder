json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :nom
  json.url restaurant_url(restaurant, format: :json)
end
