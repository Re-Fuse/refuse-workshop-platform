Rails.application.routes.draw do
  get 'director' => 'visitors#director'
  root to: 'visitors#index'
  devise_for :users
  ActiveAdmin.routes(self)
  resources :users

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
