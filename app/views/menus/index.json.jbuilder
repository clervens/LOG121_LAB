if params[:cached].present?
  json.cache! [@menus, params[:cached]], expires_in: 10.minutes do
    puts 'use cache'
    json.array!(@menus) do |menu|
      json.extract! menu, :id, :nom
      json.plats menu.plats do |plat|
        json.extract! plat, :id, :nom, :desc, :description, :prix, :created_at, :updated_at
      end
      json.url restaurant_menu_url @restaurant, menu, format: :json
    end
  end
else 
  json.array!(@menus) do |menu|
    json.extract! menu, :id, :nom
    json.plats menu.plats do |plat|
      json.extract! plat, :id, :nom, :desc, :description, :prix, :created_at, :updated_at
    end
    json.url restaurant_menu_url @restaurant, menu, format: :json
  end 
end
