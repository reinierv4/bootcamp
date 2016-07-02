class ProductsController < ApplicationController
	def show
		redirect_to user_path unless session[:user]
		@product = Product.find(params[:id])
		@current_bids = @product.bids.order(ammount: :asc)
		@bid = Bid.new
	end

	def create
		redirect_to user_path unless session[:user]
		user =  User.find(params[:user_id])
		
		user.products.create(
			title: params[:product][:title],
			description: params[:product][:description],
			minimum_price: params[:product][:minimum_price],
			deadline: params[:product][:deadline]
		)

		redirect_to user_path(user)
	end

	def destroy

	end

	def new
		redirect_to user_path unless session[:user]
		@user = User.find(params[:user_id])
		@product = Product.new
	end

	def index
		redirect_to user_path unless session[:user]
		unless params[:user_id]
			@products = Product.all 
		end

	end

end
