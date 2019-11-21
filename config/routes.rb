Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :users
      resources :answers
      resources :questions
      # resources :login, only: [:create, :show]
      post '/login', to: 'login#login'
      get '/profile', to: 'users#profile'
      post '/signup', to: 'users#create'
      # post '/questions' to: ''

      resources :questions do 
        resources :answers
      end 


    end
  end
end
   
  



