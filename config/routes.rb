Rails.application.routes.draw do
  devise_for :users
  get 'pages/main'
  get 'pages/about'
  get 'pages/user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
