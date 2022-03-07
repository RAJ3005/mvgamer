Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/statistics', to: 'pages#statistics'
  get '/settings', to: 'pages#settings'
  resources :wallet_entries, only: [:show, :create]
  resources :challenges do
    resources :bets, only: [:index, :new, :create]
  end
end
