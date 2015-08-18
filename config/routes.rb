Rails.application.routes.draw do

  devise_for :users

  root to: 'dashboard#index'

  resources :albums, only: [:new, :create, :show, :destroy]
  get 'albums', to: 'albums#list'
end
