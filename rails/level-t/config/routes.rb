Rails.application.routes.draw do

  devise_for :users
  resources :addresses
  resources :links
  get 'links/index'

  root 'links#index'
end
