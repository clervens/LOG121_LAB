if params[:cached].present?
  json.cache! [@restaurateurs, params[:cached]], expires_in: 10.minutes do
    json.array!(@restaurateurs) do |restaurateur|
      json.extract! restaurateur, :id, :nom, :prenom, :date_de_naissance, :restaurants
      json.url restaurateur_url(restaurateur, format: :json)
    end
  end
else
  json.array!(@restaurateurs) do |restaurateur|
    json.extract! restaurateur, :id, :nom, :prenom, :date_de_naissance, :restaurants
    json.url restaurateur_url(restaurateur, format: :json)
  end
end