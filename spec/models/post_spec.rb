require 'spec_helper'

describe Post do
	describe 'validations' do
		let(:post) { Post.new(title: "I was thinking...", content: "Thinx is awesome") }

		it 'is invalid without a title' do
			post.title = nil
			expect(post).to be_invalid
		end

		it 'is invalid without content' do
			post.content = nil
			expect(post).to be_invalid
		end

	end

describe 'associations' do
    let(:post) { Post.new(title: "I was thinking...", content: "Thinx is awesome")  }
    let(:comment) { Comment.new(comment: "I agree!") }

    it "has many comments" do
      post.comments.push(comment)
      expect(post.comments.length).to eq(1)
    end
    
  end

end