Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  root 'static_pages#index'
  resources :courses
end
