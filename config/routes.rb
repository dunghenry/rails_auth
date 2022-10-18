Rails.application.routes.draw do
  resources :books
  resources :users
  post "/users/login", to: "users#login"
  get "/authbooks", to: "books#getbooks"
end
