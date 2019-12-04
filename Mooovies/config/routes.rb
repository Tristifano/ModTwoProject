Rails.application.routes.draw do
  root to:"home#index", as: "main_page"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  resources :sessions
  resources :reviews
  resources :movies
  resources :users
end
