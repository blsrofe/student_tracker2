Rails.application.routes.draw do

  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/parent_login', to: "parent_sessions#new"
  post '/parent_login', to: "parent_sessions#create"
  get '/parent_logout', to: "parent_sessions#destroy"

  get '/parent_dashboard', to: "parent_dashboard#index"

  get '/dashboard', to: "dashboard#index"
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :observations
  resources :users, only: [:edit, :update]
  resources :students, only: [:show]

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
    resources :users, except: [:show, :edit, :update]
    resources :klasses, except: [:show, :index]
    resources :students, except: [:show]
    resources :enrollments, except: [:show, :index]
    put '/make_admin', to: "users#make_admin"
    put '/make_teacher', to: "users#make_teacher"
  end
end
