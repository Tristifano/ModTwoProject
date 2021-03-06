Rails.application.routes.draw do

  #home controller route
  root to:"home#index", as: "main_page"

  #users controller route
  get "signup", to: "users#new", as: "signup"

  #sessions controller route
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  
  #movies controller route
  get "search", to: "movies#index", as: "search"

  #review controller route
  post "add_review", to: 'reviews#create', as: 'add_review'

  #comment controller route
  get "comment", to: 'comments#new', as: 'comment'
  post "add_comment", to: 'comments#create', as: 'add_comment'

  resources :sessions
  resources :reviews
  resources :movies
  resources :users
  resources :movielists
  resources :lists
  
  resources :comments
  resources :watchlistmovies
  resources :watchlists

end
