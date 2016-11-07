Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  resources :stories
  get "profile", :to => 'users#edit'
  resources :users, only: [:update]
  get ':custom_url', :to => 'companies#show', as: 'company'
end
