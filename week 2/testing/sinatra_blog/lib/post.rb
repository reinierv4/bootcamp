require_relative 'blog'

class Post

	attr_accessor :title, :date, :text, :sponsored, :author, :category

	def initialize (title, date, text, sponsored, author, category)
		
		@title = title
		@date = Date.parse(date)
		@text = text
		@sponsored = sponsored
		@author = author
		@category = category
	
	end
end