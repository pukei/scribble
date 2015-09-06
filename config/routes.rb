Rails.application.routes.draw do
  root 'scribbles#index'
  resources :scribbles

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
