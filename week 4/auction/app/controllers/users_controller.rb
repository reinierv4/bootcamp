class UsersController < ApplicationController
	
	def welcome
		@user = User.new
		reset_session
	end

	def login
		#binding.pry
		if user = User.find_by('email = ?', params[:email])
			if user && user.password == params[:password]
				session[:user] = user.id
				redirect_to user_path(user)
		else
			flash[:notice] = "Password incorrect idiot"
			redirect_to '/'
		end
	else
		redirect_to new_user_path
	end
	
	end

	def show
		redirect_to user_path unless session[:user]
		@user =  User.find(params[:id])
		@products = @user.products
		
	end

	def create
		
		user = User.new(user_params)

		if user.save
			redirect_to user_path(user)
		else
			redirect_to new_user_path
		end

	end

	def destroy

	end

	def new
		@user = User.new
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
