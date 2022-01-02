Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "login#index"

  # Login
  get "login/index"
  post "login/index", to: "login#handle_login"

  # User
  resources :user

  # password reset
  get "password/reset", to: "password_reset#index"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"
end
