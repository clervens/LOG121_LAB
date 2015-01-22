Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root 'static_pages#home'

  resources :restaurants
end