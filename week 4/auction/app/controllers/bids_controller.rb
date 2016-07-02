class BidsController < ApplicationController

	def create
		
		product = Product.find(params[:product_id])
		bid = params[:bid][:ammount].to_f
		user = User.find(session[:user])
		if user && product.valid_bid(bid, user.id)
			
			product.bids.create(
				ammount: bid,
				user_id: session[:user]
				)
		end	
		
		redirect_to product_path(Product.find(params[:product_id]))
	
	end


end
