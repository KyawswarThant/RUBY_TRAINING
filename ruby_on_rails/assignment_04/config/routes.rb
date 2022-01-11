Rails.application.routes.draw do
  root "user#login"

  # user
  get "login", to: "user#login"
  post "login", to: "user#handle_login"
  post "logout", to: "user#handle_logout"
  resources :user

  # post
  get "get_posts", to: "post#get_posts"
  resources :post
end
