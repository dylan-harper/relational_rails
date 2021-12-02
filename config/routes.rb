Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/elevatorcos', to: 'elevatorcos#index'
  get '/banks', to:'banks#index'
  get '/elevatorcos/:id', to: 'elevatorcos#show'
end
