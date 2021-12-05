Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #User Story 1
  get '/elevatorcos', to: 'elevatorcos#index'
  get '/banks', to:'banks#index'

  #User Story 2
  get '/banks/:id', to: 'banks#show'

  #User Story 11
  get '/elevatorcos/new', to: 'elevatorcos#new'
  post '/elevatorcos', to: 'elevatorcos#create'

  #User Story 3
  get '/buildings', to: 'buildings#index'
  get '/branches', to: 'branches#index'

  #User Story 4
  get '/buildings/:id', to: 'buildings#show'
  get '/branches/:id', to: 'branches#show'

  #User Story 5
  get '/banks/:bank_id/branches', to: 'bank_branches#index'
  get 'elevatorcos/:elevatorco_id/buildings', to: 'elevatorco_buildings#index'

  get '/elevatorcos/:id', to: 'elevatorcos#show'
end
