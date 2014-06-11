Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/word_list'

  get 'static_pages/categories'

  get 'static_pages/lesson'

  get 'static_pages/result'

  get 'static_pages/user_show'

  get 'static_pages/all_users'

  get 'static_pages/lesson_list'

  resources :words
  resources :categories
  resources :users
end
