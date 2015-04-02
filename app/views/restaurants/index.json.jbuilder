if params[:cached].present?
  json.cache! [@restaurants, params[:cached]], expires_in: 10.minutes do
    json.array!(@restaurants) do |restaurant|
      json.extract! restaurant, :id, :nom, :adresse, :restaurateur
      json.url restaurant_url(restaurant, format: :json)
    end
  end
else
  json.array!(@restaurants) do |restaurant|
    json.extract! restaurant, :id, :nom, :adresse, :restaurateur
    json.url restaurant_url(restaurant, format: :json)
  end
end