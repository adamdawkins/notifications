Rails.application.routes.draw do
  resources :change_orders
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "change_orders#index"
end
