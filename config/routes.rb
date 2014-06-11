Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/home'

  resources :words
  resources :categories
  resources :users

  get '/home' => 'entries#index'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  get '/signup' =>  'users#new'
  get '/signin' =>  'sessions#new'
  get '/signout' =>  'sessions#destroy'
end
