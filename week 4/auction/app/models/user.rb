class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /([a-z]|\d)+\@[a-z]+\.[a-z]+/
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }
	VALID_NAME_REGEX = /[a-zA-Z]+/
	validates :name, presence: true, length: {maximum: 100},
						format: { with: VALID_NAME_REGEX}
					
	

	has_many :products
	has_many :bids
end
