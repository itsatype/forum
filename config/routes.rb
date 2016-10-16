Rails.application.routes.draw do
	resources :posts
	resources :comments, only: :create
	resources :messages, only: [:index, :show]
	resources :users, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :messages, only: [:new, :create]
  end

  get '/', to: 'posts#index'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
end
