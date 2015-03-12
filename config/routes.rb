Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
	  devise_for :users
	  root 'static_pages#home'
	  resources :commandes do
      collection do
        get '/pretes', to: 'commandes#pretes'
        get '/get_map', to: 'commandes#get_map'
      end
    end
	  resources :restaurants do
	  	resources :menus
      resources :livraisons
      resources :commandes
	  end
	end
  ActiveAdmin.routes(self)
end