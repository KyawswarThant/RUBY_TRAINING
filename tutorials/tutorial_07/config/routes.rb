Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "upload_image#index"
  get 'upload_image/index'
  post 'handle_upload', to: "upload_image#handle_upload"
end
