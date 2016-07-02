class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids


	def valid_bid(bid, user_id)

		high_enough(bid) && valid_user(user_id)
	
	end

	def high_enough(bid)
		if self.bids.order(ammount: :desc).first
			if bid>self.bids.order(ammount: :desc).first.ammount && bid > self.minimum_price
				true
			else
				false
			end
		elsif bid > self.minimum_price
			true
		else
			false
		end
	end

	def valid_user(user_id)

		!(self.user_id == user_id)

	end

		


end
