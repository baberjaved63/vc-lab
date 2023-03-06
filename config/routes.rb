Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "people#index"

  resources :people, except: %i[show]
  resources :companies, except: %i[show]
end
