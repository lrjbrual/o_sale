Rails.application.routes.draw do
  get 'users/new', to: 'users#new', as: 'new_user'
  get '/signup', to: 'users#new' ##this can redirect to user/new
  resources :users, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'session'

  # get 'products/index'
  # get 'products/new'
  # get 'products/create'
  # get 'products/show'
  root to: "products#index"

  # get '/products', to: 'products#index'
  # get '/products/new', to: 'products#new', as: 'new_product'
  # get '/products/:id', to: 'products#show', as: 'product'
  # post '/products', to: 'products#create'

  resources :products do 
    resources :comments, only: [:create] ## this inherit inside the product
  end

  namespace :api do
    namespace :v1 do 
      resources :products do 
        resources :comments, only: [:create] ## this inherit inside the product
      end
    end
    resources :users, only: [:create]
    post '/signin', to: 'sessions#create'
    delete '/signout', to: 'sessions#destroy', as: 'session'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
