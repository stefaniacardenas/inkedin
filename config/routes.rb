Rails.application.routes.draw do

  root to: 'instagram#index'
  devise_for :users
  resources :posts

end
