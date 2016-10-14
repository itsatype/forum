class PostsController < ApplicationController

  before_action :find_post, except: [:new, :create, :index]

	def new
		@post = Post.new
	end

	def create
		Aws.config.update({credentials: Aws::Credentials.new()})
		s3 = Aws::S3::Resource.new(region: 'us-east-1')
		@post = Post.create(post_params)
		@post.user = current_user
		if @post.save
			image = params["post"]["image"]				
			obj = s3.bucket('thinxforum').object(@post.id)
			obj.upload_file(image.tempfile)				
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

	def index
		@posts = Post.all
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end