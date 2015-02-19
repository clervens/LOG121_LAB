json.array!(@menus) do |menu|
  json.extract! menu, :id, :nom, :plats
  json.url restaurant_menu_url @restaurant, menu, format: :json
end
