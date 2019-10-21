Rails.application.routes.draw do

  devise_for :users
  resources :addresses
  resources :links

  resources :shorteners
  #resources :shorteners, only: [:index, :show, :new, :create, :destroy]
  root 'links#index'
  get '/:short_url', to: 'shorteners#show'
end
