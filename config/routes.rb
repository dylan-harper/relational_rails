Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #User Story 1
  get '/elevatorcos', to: 'elevatorcos#index'
  get '/banks', to:'banks#index'

  #User Story 2
  get '/banks/:id', to: 'banks#show'
  get '/elevatorcos/:id', to: 'elevatorcos#show'

  #User Story 3
  get '/buildings', to: 'buildings#index'
  get '/branches', to: 'branches#index'

  #User Story 4
  get '/buildings/:id', to: 'buildings#show'


end
