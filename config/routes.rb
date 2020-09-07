Rails.application.routes.draw do
  resources :users
  post "/login" , to: "authentication#login"
  resources :customers 
  resources :transaction, only: [:index, :create, :update, :destroy]
end
