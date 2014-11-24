class User < ActiveRecord::Base
	before_create :set_auth_token
	has_secure_password
	has_many :outfits, dependent: :destroy
	has_many :items, dependent: :destroy
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_uniqueness_of :auth_token


	def set_auth_token
		return if auth_token.present?
		self.auth_token = generate_auth_token
	end

	private

	def generate_auth_token
		loop do
			token = SecureRandom.hex
			break token unless self.class.exists?(auth_token: token)
		end
	end
end
