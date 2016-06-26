require 'pry'

class Users
	
	attr_accessor :user_list

	
	def initialize
		@user_list = {
			reinier: "verbeek",
			satwat: "12345",
			marcos: "collado"
		}
	end


	def checkCredentials(user, password)

		binding.pry
		@user_list[user.to_sym] == password

	end



end
