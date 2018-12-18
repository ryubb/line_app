Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"
  get "contact", to: "home#contact"
  get "friends", to: "home#friends"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users
  resources :timelines, only: [:index, :create, :destroy]
  resources :friendships, only: :create
  resources :messages, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
