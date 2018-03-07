Rails.application.routes.draw do
  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts, except: [:index]
   end
  
  resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :questions

  resources :advertisements

  get 'about' => 'welcome#about'
  
  post 'users/confirm' => 'users#confirm'

  root 'welcome#index'
  

  
end