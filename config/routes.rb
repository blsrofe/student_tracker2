Rails.application.routes.draw do

  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/dashboard', to: "dashboard#index"
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :observations
  resources :users, only: [:edit, :update]

  resources :klasses do
    resources :students, only: [:index]
  end

  namespace :students do
    scope "/:id/" do
      resources :observations, only: [:index]
    end
  end

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    resources :users
    resources :klasses, only: [:new, :create, :update, :edit]
    resources :students, only: [:new, :create, :update, :edit, :index]
  end
end
