Rails.application.routes.draw do
	resources :posts
	resources :comments, only: [:create]	
	resources :users, only: [:new, :create]	
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'  
  get '/register', to: 'users#new'
end
