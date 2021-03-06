class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id
		if @user.save
			redirect_to posts_path
		else
			flash[:alert] = "You username or password is invalid"						
			render 'new'
		end	
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@user = User.find_by(name: params[:name])
		@user ? message = "Sorry, that username already exists" : message = "Username available!"
		render json: { message: message } 
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end