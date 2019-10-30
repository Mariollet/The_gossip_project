Rails.application.routes.draw do

  root "home#welcome"
  resources :users
  resources :gossips
  resources :cities, only: [:index,:show]
end
