Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      post '/items/:id', to: "items#create"
      get '/items/:id', to: "items#show"
      patch '/items/:id', to: "items#destroy"
      get '/items', to: "items#index"
    end
  end
end
