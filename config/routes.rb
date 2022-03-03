Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/statistics', to: 'pages#statistics'
  resources :challenges do
    resources :bets, only: :create
  end
end
