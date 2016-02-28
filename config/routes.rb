Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      post '/meds/search', to: 'meds#search', as: 'meds_search'
      get '/meds/:id', to: 'meds#show', as: 'med_path'
    end
  end
end
