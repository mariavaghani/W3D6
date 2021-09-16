Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users
  # get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'show_user'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :artwork_shares, only: [ :create, :destroy ]
  resources :comments, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
  end

  resources :artworks do
    resources :comments, only: :index
  end
end
