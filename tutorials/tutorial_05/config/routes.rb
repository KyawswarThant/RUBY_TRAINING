Rails.application.routes.draw do
  root "upload_file#index"
  get 'upload_file/index'
  post "upload_file/upload", to: "upload_file#handle_upload"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
