# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Account < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation, :user_attributes, :band_attributes

	has_secure_password

	has_and_belongs_to_many :roles

	has_one :user, :dependent => :destroy
	accepts_nested_attributes_for :user

	has_one :band, :dependent => :destroy
	accepts_nested_attributes_for :band

	before_save { self.email.downcase! }
	before_save :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates 	:email, 
					:presence => true, 
					:format => { :with => VALID_EMAIL_REGEX },
					:uniqueness => { :case_sensitive => false }

	validates	:password,
					#presence is enforced in database
					#:presence => true,
					:length => { :minimum => 6 }

	validates	:password_confirmation,
					:presence => true


	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
