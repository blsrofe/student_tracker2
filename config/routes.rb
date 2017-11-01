Rails.application.routes.draw do

   root "welcome#index"

   get '/login', to: "sessions#new"
   post '/login', to: "sessions#create"
   delete '/logout', to: "sessions#destroy"

   get '/dashboard', to: "dashboard#index"

   resources :klasses, except: [:index] do
     resources :students
   end
end
