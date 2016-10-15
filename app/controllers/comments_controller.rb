class CommentsController < ApplicationController

  before_action :authorized?, only: [:create]

	def create
		@comment = Comment.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to post_path(@comment.post_id)
			flash[:notice] = "Success! Comment successfully created."			
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :post_id)
	end

end