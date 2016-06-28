class Contact < ActiveRecord::Base

	before_save { self.email = email.downcase }
 	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /([a-z]|\d)+\@[a-z]+\.[a-z]+/
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }
	VALID_PHONE_NUMBER_REGEX = /\+?\d+/
	validates :phone, presence: true, length: { maximum: 15},
	                    format: { with: VALID_PHONE_NUMBER_REGEX }
	VALID_ADDRESS_REGEX = /([a-zA-Z]|\s)+\s\d/
	validates :address, length: { minimum: 5 },
						format: { with: VALID_ADDRESS_REGEX }	
end
