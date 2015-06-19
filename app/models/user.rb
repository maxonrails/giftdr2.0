class User < ActiveRecord::Base
	has_many :reminders
	class << self
		def from_omniauth auth_hash
			user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
			user.name = auth_hash['info']['name']
			user.image_url = auth_hash['info']['image']
			user.email = auth_hash['info']['email']
			user.save!
			user
		end
	end
end
