Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    root 'sessions#new'
    resources :sessions
    resources :categories
    resources :products
  end
end
