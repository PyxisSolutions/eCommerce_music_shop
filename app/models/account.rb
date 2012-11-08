class Account < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation

	has_secure_password

	#has_and_belongs_to_many :roles

	#has_one :user

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
