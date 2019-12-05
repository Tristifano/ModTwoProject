Rails.application.routes.draw do

  resources :movielists
  resources :lists
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  root to:"home#index", as: "main_page"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "search", to: "searches#index", as: "search"
  post "search", to: "searches#index", as: "keyword"
  

  resources :sessions
  resources :reviews
  resources :movies
  resources :users
  resources :lists
  resources :movielist

end
