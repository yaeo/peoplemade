Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  resources :stories
  resources :products
  get "profile", :to => 'users#edit'
  resources :users, only: [:update]
  get ':custom_url', :to => 'companies#show', as: 'company'
  resources :uploads, only: [:create]

end
