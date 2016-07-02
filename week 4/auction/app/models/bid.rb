class Bid < ActiveRecord::Base
	
	validates :ammount, presence: true

	belongs_to :product
	belongs_to :user

	
end
