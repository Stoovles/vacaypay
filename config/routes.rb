Rails.application.routes.draw do
  root to: "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/vacations', to: 'users/vacations#index', as: :vacations
  get '/dashboard', to: 'users#show', as: :dashboard

  get '/oauth', to: 'users/dwollas#create', as: :users_auth

  namespace :users do
    resources :dwollas, only: [:create, :new]
    post '/transfer', to: 'dwollas#transfer', as: :dwollas_transfer
    resources :funding_sources, only: [:new]
  end

  get '/update_funding_source', to: 'users#update'

  resources :vacations, only: [:show, :new, :create]
  resources :users, only: [:new, :create, :update]
  resources :dwolla, only: [:new, :create]

  namespace :owner do
    resources :vacations, only: [:show]
  end
end
