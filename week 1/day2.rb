require 'date'

class Blog

	attr_accessor :current_page
	
	def initialize
		@posts = []
		@current_page = 1
	end

	def add_post(post)
		
		@posts.push(post)
	
	end

	def publish_front_page 
		
		@posts.sort! { |posta,postb| postb.date <=> posta.date }

		pages = (@posts.length/3.0).ceil

		start_post = 3 * (@current_page-1)
		
		@posts.each_with_index do |post, index|
			
			if (index) >= start_post && (index) < (start_post+3)
				if post.sponsored 
					puts "************#{post.title}************"
				else
					puts post.title
				end
				puts "*****************************"
				puts post.text
				puts "-----------------------------"
			end
		end

		#Pages
		print "previous "
		i=1
		pages.times do
			print "#{i} "
			i += 1
		end
		print "next"
		puts ""
		command = gets.chomp()
		
		if command =="next"
			@current_page =[(@current_page + 1), pages].min
		elsif command == "previous"
			@current_page = [(@current_page - 1), 1].max
		elsif command == "q"
			return
		else
			puts "unkown command please provide next or previous"
		end
		publish_front_page
	end
end



class Post

	attr_accessor :title, :date, :text, :sponsored

	def initialize (title, date, text, sponsored)
		
		@title = title
		@date = Date.parse(date)
		@text = text
		@sponsored = sponsored
	
	end
end

blog = Blog.new
blog.add_post Post.new("Post 1", '2010-03-15', "This is my first post and should appear last",true)
blog.add_post Post.new("Post 2", '2009-02-15', "This is my first post and should appear middle",false)
blog.add_post Post.new("Post 3", '2008-01-15', "This is my last post and should appear first",true)
blog.add_post Post.new("Post 4", '2007-03-15', "This is my first post and should appear last",true)
blog.add_post Post.new("Post 5", '2006-02-15', "This is my first post and should appear middle",false)
blog.add_post Post.new("Post 6", '2005-01-15', "This is my last post and should appear first",true)

blog.publish_front_page


