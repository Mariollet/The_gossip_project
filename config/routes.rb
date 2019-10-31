Rails.application.routes.draw do

  root "sessions#new"
  get "welcome", to: "home#welcome"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :gossips
  resources :cities, only: [:index,:show]
end
