Rails.application.routes.draw do
  namespace :users do
    resources :user_stocks, only: [:create, :destroy]
    resources :users, only: [:show]
  end
  #namespace :users do
  get 'portfolio', to: 'users/users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'users/users#friends'
  get 'search_friends', to: 'users/users#search'
  
  resources :friendships, only: [:create, :destroy]
  #end
  # devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
