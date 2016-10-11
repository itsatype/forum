Rails.application.routes.draw do
	resources :posts
	resources :comments, only: [:create]	
end
