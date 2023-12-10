Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  resources :products

  get 'about', to:'products#about'
  post 'products/add_to_cart/:id', to:'application#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to:'application#remove_from_cart', as: 'remove_from_cart'
end
