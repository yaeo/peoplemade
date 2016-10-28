Rails.application.routes.draw do
  devise_for :users
  root :to => 'stories#index'
  resources :stories, only: [:show]
  get "profile", :to => 'users#edit'
  resource :users, path: 'profile', as: 'profile', only: [:update]
end
