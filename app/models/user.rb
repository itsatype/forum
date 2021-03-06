# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
	has_many :posts
	has_many :comments
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'  

	has_secure_password

	validates :name, :email, :password, presence: true
	validates :name, :email, uniqueness: true
	validates :password, confirmation: true
end
