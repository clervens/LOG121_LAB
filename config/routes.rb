Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
	  devise_for :users
	  root 'static_pages#home'
	  resources :commandes
	  resources :restaurants do
	  	resources :menus
	  end
	 end
  ActiveAdmin.routes(self)
end