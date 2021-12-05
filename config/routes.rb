Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #User Story 1
  get '/elevatorcos', to: 'elevatorcos#index'
  get '/banks', to:'banks#index'

  get '/banks/new', to: 'banks#new'
  get '/banks/:id/branches/new', to: 'bank_branches#new'
  post '/banks/:id/branches', to: 'bank_branches#create'
  post '/banks', to:'banks#create'

  #User Story 2
  get '/banks/:id', to: 'banks#show'
  get '/banks/:id/edit', to: 'banks#edit'
  patch '/banks/:id', to: 'banks#update'

  #User Story 11
  get '/elevatorcos/new', to: 'elevatorcos#new'
  post '/elevatorcos', to: 'elevatorcos#create'

  #User Story 13
  get '/elevatorcos/:id/buildings/new', to: 'elevatorco_buildings#new'
  post '/elevatorcos/:id/buildings/', to: 'elevatorco_buildings#create'

  #User Story 12
  get '/elevatorcos/:id/edit', to: 'elevatorcos#edit'
  patch '/elevatorcos/:id/', to: 'elevatorcos#update'

  #User Story 3
  get '/buildings', to: 'buildings#index'
  get '/branches', to: 'branches#index'

  #User Story 4
  get '/buildings/:id', to: 'buildings#show'
  get '/branches/:id', to: 'branches#show'

  #User Story 5
  get '/banks/:bank_id/branches', to: 'bank_branches#index'
  get 'elevatorcos/:id/buildings', to: 'elevatorco_buildings#index'

  get '/elevatorcos/:id', to: 'elevatorcos#show'
  #User Story 11
  # get '/banks/new', to: 'banks#new'
end
