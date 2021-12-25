Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "age#index"
  get "/show_age", to: "age#show_age"
  post "/generate_age", to: "age#generate_age"
end
