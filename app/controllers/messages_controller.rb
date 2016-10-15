class MessagesController < ApplicationController

  before_action :find_user, only: [:new, :create]  
  before_action :authorized?

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(message_params)
		@message.recipient = @user
		@message.sender = current_user
		if @message.save
			redirect_to posts_path
	 		flash[:notice] = "Success! Message successfully sent to #{@user.name}."			
		else 
			render 'new'
		end
	end

	def show
		@message = Message.find(params[:id])		
	end

	def index
		@messages = Message.where(recipient_id: current_user.id)
	end

	private

	def message_params
		params.require(:message).permit(:content)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

end