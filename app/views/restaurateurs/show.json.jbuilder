if params[:cached].present?
  json.cache! [@restaurateur, params[:cached]], expires_in: 10.minutes do
    json.extract! @restaurateur, :id, :nom, :prenom, :date_de_naissance, :restaurants, :created_at, :updated_at
  end
else
  json.extract! @restaurateur, :id, :nom, :prenom, :date_de_naissance, :restaurants, :created_at, :updated_at
end