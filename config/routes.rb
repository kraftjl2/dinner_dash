DinnerDash::Application.routes.draw do
  
  resources :categories
  resources :items
  resources :menu, only: [:index]
  
  get  'about', to: 'marketing#about'
  get  'faqs',  to: 'marketing#faqs'

  root 'marketing#index'
  
end