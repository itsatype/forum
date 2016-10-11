Rails.application.routes.draw do
	resources :posts
	resources :comments, only: [:create]	
	resources :users, only: [:new, :create]	
end
