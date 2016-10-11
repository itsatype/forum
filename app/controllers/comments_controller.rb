class CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to post_path(@comment.post_id)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :post_id)
	end

	def current_user
		User.find(1)
	end

end