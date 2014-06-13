Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :sessions, only: [:new, :created, :destroy]
    resources :words
    resources :categories


    root to: 'sessions#new'

    post '/signin' => 'sessions#create'
    post '/signout' => 'sessions#destroy'

    get '/signin' => 'sessions#new'
    get '/home' => 'static_pages#home'
  end

  resources :categories
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :created, :destroy]
  resources :users
  resources :lessons, only: [:index, :show, :edit, :create, :update]
  resources :started_lessons, only: [:update]
  resources :words, only: [:index]

  root to: 'static_pages#home'

  post 'signin' => 'sessions#create'
  
  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'users#new'
end
