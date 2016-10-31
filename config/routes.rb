Rails.application.routes.draw do
  devise_for :users
  root :to => 'stories#index'
  resources :stories, only: [:show]
  get "profile", :to => 'users#edit'
  resources :users, only: [:update]
end
