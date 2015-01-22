Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'

  resources :restaurants
end
