Rails.application.routes.draw do
  root 'scribbles#index'
  resources :scribbles
end
