DinnerDash::Application.routes.draw do

  get 'about', to: 'marketing#about'
  get 'faq', to: 'marketing#faq'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :orders, except: [:new]
  resources :users
  resources :categories
  resources :items
  resources :menus, only: [:index]
  
  get 'cart',                 to: 'cart#show',   as: :cart
  get 'cart/:item_id/add',    to: 'cart#add',    as: :add_item_cart
  get 'cart/:item_id/remove', to: 'cart#remove', as: :remove_item_cart
  


  root to: 'marketing#index'
end
