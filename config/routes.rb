Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      post '/meds/search', to: 'meds#search', as: 'meds_search'
      get '/meds/:id', to: 'meds#show', as: 'med_path'
      # post '/login', to: 'sessions#create'
      # delete '/logout', to: 'sessions#destroy'
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
    end
  end
end
