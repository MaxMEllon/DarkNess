Rails.application.routes.draw do

  devise_for :users

  root to: 'dashboard#index'

  resources :submissions, only: [:new, :create]
  resources :albums, only: [:create]
end
