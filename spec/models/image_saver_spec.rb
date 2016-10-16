require 'spec_helper'

describe ImageSaver do
	describe "#initialize" do
		let(:post) { Post.new(title: "I was thinking...", content: "Thinx is awesome") }
		let(:imagesaver) { ImageSaver.new(post, "image/path.jpg" ) }

		it "initalizes with a post" do
			expect(imagesaver.post.title).to eq("I was thinking...")
		end
	

		it "initalizes with a post" do
			expect(imagesaver.image).to eq("image/path.jpg")
		end

	end

end