Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: %i[index]

  # Defines the root path route ("/")
  root "foods#index"
end
