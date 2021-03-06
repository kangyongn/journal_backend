Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :journals

      get '/current_user', to: 'auth#show'
      post '/login', to: 'auth#create'
    end
  end
end
