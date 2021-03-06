Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/statistics', to: 'pages#statistics'
  get '/settings', to: 'pages#settings'
  get '/finale', to: 'pages#finale'
  resources :wallet_entries, only: [:show, :edit, :update, :create] do
    resources :payments, only: :new
  end
  post 'dashboard', to: 'bets#completion', as: 'completion'
  resources :challenges do
    resources :bets, only: [:index, :new, :create]
  end
end
