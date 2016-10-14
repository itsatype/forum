class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized?

  private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def logged_in?
    !!current_user
  end

  def authorized?
    redirect_to login_path if !logged_in?
  end

end
