Rails.application.routes.draw do
  resources :users, only: [:create]
  post "/login" , to: "authentication#login"
  resources :customers, only: [:index, :create]
end
