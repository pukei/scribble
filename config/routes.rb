Rails.application.routes.draw do
  root 'scribbles#index'
  resources :scribbles do
    # resources :comments, only: [:create, :destroy, :update]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
