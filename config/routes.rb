 DinnerDash::Application.routes.draw do
  
  get "sessions/new"
  resources :sales
  resources :reviews
  resources :sessions
  resources :orders, except: [:new]
  resources :users
  resources :categories
  resources :items do
    resources :reviews
  end
  resources :menu, only: [:index]
  
  get  'about', to: 'marketing#about'
  get  'faqs',  to: 'marketing#faqs'

  get 'signup',  to: 'users#new' 
   
  root 'marketing#index'
  
end