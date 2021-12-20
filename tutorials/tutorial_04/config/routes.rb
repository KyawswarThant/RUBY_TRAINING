Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "login#index"
  get "/login", to: "login#index"
  post "/handle_login", to: "login#handle_login"
  get "/handle_logout", to: "login#handle_logout"
end
