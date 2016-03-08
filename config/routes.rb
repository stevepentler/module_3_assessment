Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      get '/items/:id', to: "items#show"
      get '/items', to: "items#index"
    end
  end
end
