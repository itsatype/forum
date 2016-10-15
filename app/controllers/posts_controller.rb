class PostsController < ApplicationController

  before_action :find_post, except: [:new, :create, :index]
  before_action :authorized?, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.user = current_user
		if @post.save
			ImageSaver.new(@post, params["post"]["image"]).save_to_aws
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

	def edit
	end

	def update
		@post.update(post_params)
	 	redirect_to posts_path
	 	flash[:notice] = "Success! Post successfully updated."
	end

	def index
		@posts = Post.all
	end

	def destroy
		Post.destroy(@post)
		redirect_to posts_path
	 	flash[:notice] = "Success! Post successfully deleted."
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end