require 'date'
require_relative 'post'


class Blog

	attr_accessor :current_page, :posts
	
	def initialize
		@posts = []
		@current_page = 1
	end

	def add_post(post)
		
		@posts.push(post)
		@posts.sort! { |posta,postb| postb.date <=> posta.date }
	
	end

	def posts
		@posts
	end

	def latest_posts
		@posts
	end
	



	

end


