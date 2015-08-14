Rails.application.routes.draw do

  devise_for :users

  root to: 'dashboard#index'

  resources :albums, only: [:new, :create]
  get 'albums/list', to: 'albums#list'
end
