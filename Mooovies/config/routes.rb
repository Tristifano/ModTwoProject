Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :delete]
  resources :movies, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
