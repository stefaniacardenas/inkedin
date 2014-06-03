Rails.application.routes.draw do
  
  root to: 'home#index'
  devise_for :users
  resources :posts
  resources :tags

end
