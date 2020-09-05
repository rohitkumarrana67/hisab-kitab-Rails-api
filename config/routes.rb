Rails.application.routes.draw do
  resources :users
  post "/login" , to: "authentication#login"
  resources :customers, only: [:index, :create]
end
