Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  # Home
  get "home", to: "home#index"

  # Post
  resources :posts

  # User
  resources :users
end
