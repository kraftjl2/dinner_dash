DinnerDash::Application.routes.draw do

  resources :sales

  resources :reviews

  get 'about', to: 'marketing#about'
  get 'faq', to: 'marketing#faq'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :orders, except: [:new]
  resources :users
  resources :categories
  resources :items do
    resources :reviews
  end
  resources :menus, only: [:index]
  
  get 'cart',                 to: 'cart#show',   as: :cart
  get 'cart/:item_id/add',    to: 'cart#add',    as: :add_item_cart
  get 'cart/:item_id/remove', to: 'cart#remove', as: :remove_item_cart
  
  get 'orders/:id/remove/:item_id', to: 'orders#remove_item', as: :remove_item_order
  get 'orders/:id/cancel', to: 'orders#cancel', as: :cancel
  get 'orders/:id/paid', to: 'orders#paid', as: :paid
  get 'orders/:id/completed', to: 'orders#completed', as: :completed


  root to: 'marketing#index'
end
