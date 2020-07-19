Rails.application.routes.draw do
  
  resources :cards, only: [:index, :create, :update, :show]
  resources :users, only: [:create, :index]

  get 'cards/user/:user_id', to: 'cards#user_cards'
  post '/login', to: 'auth#create'

  post '/trades', to: 'trades#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
