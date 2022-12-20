Rails.application.routes.draw do
  resources :hauntings, only: [:index, :create]
  resources :ghosts, only: [:index, :show, :destroy]
  # resources :haunted_houses, only: [:index]
  get '/haunted-houses', to: 'haunted_houses#index'
  # get '/haunted-houses', to: 'haunted_houses#index'
  
end
