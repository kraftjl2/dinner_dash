 DinnerDash::Application.routes.draw do
  
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

  root 'marketing#index'
  
end