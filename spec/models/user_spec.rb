require 'spec_helper'

describe User do
	describe 'validations' do
		let(:user) { User.new(name: "user", password: "password", email: "leah@gmail.com") }
		
		it 'is valid' do
			expect(user).to be_valid
		end

		it 'is invalid without a name' do
			user.email = nil
			expect(user).to be_invalid
		end

		it 'is invalid without an email' do
			user.name = nil
			expect(user).to be_invalid
		end

		it 'is invalid without a password' do
			user.password = nil
			expect(user).to be_invalid
		end

	end

describe 'associations' do
		let(:user) { User.new(name: "user2", password: "password", email: "leah@gmail.com") }	
    let(:post) { Post.new(title: "I was thinking...", content: "Thinx is awesome")  }
    let(:post2) { Post.new(title: "Some new thought", content: "about Thinx")  }

    let(:message) { Message.new(content: "How are you!") }
    let(:message2) { Message.new(content: "I'm doing great!") }

    it "has many posts" do
      user.posts.push(post)
      user.posts.push(post2)      
      expect(user.posts.length).to eq(2)
    end

    it "has many received messages" do
      user.received_messages.push(message)
      expect(user.received_messages.length).to eq(1)
    end    

    it "has many sent messages" do
      user.sent_messages.push(message2)
      expect(user.sent_messages.length).to eq(1)
    end    
    
  end

end