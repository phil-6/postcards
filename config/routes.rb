Rails.application.routes.draw do
  root 'pages#main'
  devise_for :users

  get '/about',       to: 'pages#about'
  get '/users/:id',   to: 'pages#user_profile'

  resources :postcards
end
