Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
	  devise_for :users
    get '/users/commandes_a_preparer', to: 'commandes#a_preparer'
    get '/users/livraisons', to: 'livraisons#user_livraisons', as: 'user_livraisons'
    get '/users/livraisons/:id/livrer', to: 'livraisons#livrer', as: 'livrer'
	  root 'static_pages#home'
    get '/stats', to: 'static_pages#stats'
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