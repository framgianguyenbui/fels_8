Rails.application.routes.draw do
  resources :categories
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :created, :destroy]
  resources :users

  root to: 'static_pages#home'

  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'users#new'
end
