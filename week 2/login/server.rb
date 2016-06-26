require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?

require_relative 'lib/user.rb'


enable(:session) 
@@message = "Welcome to the page, please provide credentials to login"

get '/home' do 

	
	if session[:logged] 

		redirect('/profile')
	else 
		erb :login
	end

end


post '/check_login' do

	@users_object = Users.new
	
	@user = params[:user]
	@password = params[:password]

	
	if @users_object.checkCredentials(@user, @password)
		session[:logged] = true
		redirect('/profile')
	else
		@@message = "Wrong password!!!!!!"
	 	redirect('/home')
	end

end











