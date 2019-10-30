Rails.application.routes.draw do

  root "home#welcome"
  resources :users, only: [:new,:create,:index,:show]
  resources :gossips, only: [:new,:create,:index,:show]

end
