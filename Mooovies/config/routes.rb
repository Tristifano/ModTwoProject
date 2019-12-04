Rails.application.routes.draw do
  root to:"home#index", as: "main_page"

  #home controller
  get "signup", to: "users#new", as: "signup"

  #session controller
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  
  get "search", to: "movies#index", as: "search"

  # search controller
  # post "search", to: "searches#index", as: "keyword"
  
  resources :sessions
  resources :reviews
  resources :movies
  resources :users
end
