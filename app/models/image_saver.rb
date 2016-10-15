class ImageSaver

	attr_accessor :post, :image

	def initialize(post, image)
		@post = post
		@image = image
	end

	def save_to_aws
		Aws.config.update({credentials: Aws::Credentials.new(ENV['aws_key'], ENV['aws_secret_key'])})
		s3 = Aws::S3::Resource.new(region: 'us-east-1')			
		obj = s3.bucket('thinxforum').object(post.id.to_s)
		obj.upload_file(image.tempfile)				
	end

end