require 'spec_helper'

describe Message do
	describe 'validations' do
    let(:message) { Message.new }

		it 'is invalid without content' do
			expect(message).to be_invalid
		end

	end

describe 'associations' do
	  let(:message) { Message.new(content: "How you doin'?") }
		let(:user) { User.new(name: "user", password: "password", email: "leah@gmail.com") }
		let(:user2) { User.new(name: "user2", password: "password", email: "leah@gmail.com") }	

    it "it has a sender" do
      message.sender = user
      expect(message.sender.name).to eq("user")
    end

    it "it has a recipient" do
      message.recipient = user2
      expect(message.recipient.name).to eq("user2")
    end

  end

end