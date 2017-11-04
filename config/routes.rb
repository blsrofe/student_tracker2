Rails.application.routes.draw do

   root "welcome#index"

   get '/login', to: "sessions#new"
   post '/login', to: "sessions#create"
   get '/logout', to: "sessions#destroy"

   get '/dashboard', to: "dashboard#index"


   resources :klasses do
     resources :students, only: [:index]
   end

  namespace :students do
    scope "/:id/" do
      resources :observations, only: [:index]
    end
  end

   resources :observations

   resources :users, only: [:edit, :update]

end
