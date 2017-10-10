Rails.application.routes.draw do
  root 'static#welcome'
  get 'rides/new'
  resources :users
  resources :attractions
  resources :rides, only: [:create]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post 'rides/new' => 'rides#new'
end
