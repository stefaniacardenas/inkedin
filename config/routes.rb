Rails.application.routes.draw do

  #this is a bit of a mess, I created an InstagramController as a main server and then a post resources, probably it doesn't make much sense

  root to: 'posts#index'
  devise_for :users
  resources :posts

end
