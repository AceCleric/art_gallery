Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'dashboard#index'

  resources :users
  resources :art_pieces
  resources :employees
  resources :customer_wallets

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions', to: 'sessions#new'

  resources :art_pieces do
      put :rent_art_piece, on: :member
    end

  resources :users do
      put :remove_rented_art_piece, on: :member
    end
end
