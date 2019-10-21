Rails.application.routes.draw do
  get 'links/index'

  resources :links
  root 'links#index'
end
