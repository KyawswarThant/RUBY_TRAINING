Rails.application.routes.draw do
  root "post#index"

  resources :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end