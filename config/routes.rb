Rails.application.routes.draw do
  
  resources :cards, only: [:index, :create, :update, :show, :destroy]
  resources :users, only: [:create, :index]

  get 'cards/user/:user_id', to: 'cards#user_cards'
  post '/login', to: 'auth#create'

  get '/trades', to: 'trades#index'
  post '/trades', to: 'trades#create'
  get '/trades/:id', to: 'trades#show'
  delete '/trades/:id', to: 'trades#destroy'

  get '/offers', to: 'trades#offers'
  get '/offers/:id', to: 'trades#show'
  put '/offers/:id', to: 'trades#update_offer'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
