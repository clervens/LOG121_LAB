json.array!(@restaurateurs) do |restaurateur|
  json.extract! restaurateur, :id, :nom, :prenom, :date_de_naissance, :restaurants
  json.url restaurateur_url(restaurateur, format: :json)
end
