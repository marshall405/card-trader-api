Rails.application.routes.draw do
  
  resources :cards
  resources :users, only: [:create, :index]
  post '/login', to: 'auth#create'

  post '/trades', to: 'trades#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
