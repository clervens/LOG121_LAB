Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
	  devise_for :users
    get '/users/commandes_a_preparer', to: 'commandes#a_preparer'
	  root 'static_pages#home'
	  resources :commandes do
      collection do
        get '/pretes', to: 'commandes#pretes'
        get '/get_map', to: 'commandes#get_map'
      end
      match "/hook" => "commandes#hook", as: 'demarrer', via: :all
    end
	  resources :restaurants do
	  	resources :menus
      resources :livraisons
      resources :commandes
	  end
    resources :restaurateurs
	end
  ActiveAdmin.routes(self)
end