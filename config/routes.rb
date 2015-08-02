Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :submissions, only: [:new, :create]
  resources :albums, only: [:create]
end
