Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Parent Index
  get '/elevatorcos', to: 'elevatorcos#index'
  get '/banks', to:'banks#index'

  #Parent Create
  get '/banks/new', to: 'banks#new'

  get '/branches/:id/edit', to: 'branches#edit'
  get '/banks/:id/branches/new', to: 'bank_branches#new'
  post '/banks/:id/branches', to: 'bank_branches#create'
  post '/banks', to: 'banks#create'
  #User Story 2
  get '/banks/:id', to: 'banks#show'
  get '/banks/:id/edit', to: 'banks#edit'
  patch '/banks/:id', to: 'banks#update'
  patch '/branches/:id', to: 'branches#update'
  #User Story 11

  post '/banks', to:'banks#create'

  get '/elevatorcos/new', to: 'elevatorcos#new'
  post '/elevatorcos', to: 'elevatorcos#create'

  #Parent Update
  get '/banks/:id/edit', to: 'banks#edit'
  patch '/banks/:id', to: 'banks#update'
  get '/elevatorcos/:id/edit', to: 'elevatorcos#edit'
  patch '/elevatorcos/:id/', to: 'elevatorcos#update'

  #Child Index
  get '/buildings', to: 'buildings#index'
  get '/branches', to: 'branches#index'

  #Child Show
  get '/banks/:id', to: 'banks#show'
  get '/elevatorcos/:id', to: 'elevatorcos#show'

  #Child Update
  get '/buildings/:id/edit', to: 'buildings#edit'
  patch '/buildings/:id', to: 'buildings#update'

  #Parent Child Index
  get '/banks/:bank_id/branches', to: 'bank_branches#index'
  get 'elevatorcos/:id/buildings', to: 'elevatorco_buildings#index'

  #Parent Child Show
  get '/buildings/:id', to: 'buildings#show'
  get '/branches/:id', to: 'branches#show'

  #Parent Child Create
  get '/banks/:id/branches/new', to: 'bank_branches#new'
  post '/banks/:id/branches', to: 'bank_branches#create'
  get '/elevatorcos/:id/buildings/new', to: 'elevatorco_buildings#new'
  post '/elevatorcos/:id/buildings/', to: 'elevatorco_buildings#create'

end
