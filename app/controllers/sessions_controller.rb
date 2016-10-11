class SessionsController <  ApplicationController

#   skip_before_filter :authorize

	def new
	end

	def create
		@user = User.find_by_name(params[:name])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to posts_path
	end
end