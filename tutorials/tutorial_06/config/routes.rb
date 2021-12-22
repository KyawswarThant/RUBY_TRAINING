Rails.application.routes.draw do
  root "table#index"
  resources :table
end
