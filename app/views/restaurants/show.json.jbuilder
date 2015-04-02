if params[:cached].present?
  json.cache! [@restaurant, params[:cached]], expires_in: 10.minutes do
    json.extract! @restaurant, :id, :nom, :adresse, :restaurateur, :created_at, :updated_at
  end
else
  json.extract! @restaurant, :id, :nom, :adresse, :restaurateur, :created_at, :updated_at
end