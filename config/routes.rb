Rails.application.routes.draw do
  devise_for :users
  root :to => 'stories#index'
  resources :stories, only: [:show]
  resources :users, only: [:edit, :update]
end
