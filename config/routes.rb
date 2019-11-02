Rails.application.routes.draw do

  root "home#welcome"
  get "welcome", to: "home#welcome"
  get "contact", to: "home#contact"
  get "team", to: "home#team"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :gossips do
    resources :comments
  end
  resources :cities, only: [:index,:show]
end
