class PostsController < ApplicationController

  before_action :find_post, except: [:new, :create, :index]

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.user = current_user
	if @post.save
			redirect_to @post
			flash[:notice] = "Success! Post successfully created."
		else 
			render 'new'
		end
	end

	def show
		@comment = Comment.new
		@comments = Comment.where(post_id: @post.id)
	end

	def index
		@posts = Post.all
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end