Rails.application.routes.draw do

  root to: 'registration#home'

  resources :gossips 
  resources :users, only: [:new, :create]
  get "users/login", to: "users#login"
  post "users/login", to: "users#check"

  resources :gossips do
    resources :comments, only: [:new, :create, :index, :destroy]
  end

end












