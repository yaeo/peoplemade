Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  resources :stories, only: [:index, :new, :create, :show]
  get "profile", :to => 'users#edit'
  resources :users, only: [:update]
end
