if params[:cached].present?
  json.cache! [@menu, params[:cached]], expires_in: 10.minutes do
    json.extract! @menu, :id, :nom, :restaurant_id, :plats, :created_at, :updated_at
  end
else 
  json.extract! @menu, :id, :nom, :restaurant_id, :plats, :created_at, :updated_at
end