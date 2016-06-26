require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/blog.rb'
require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/post.rb'

require 'sinatra'
require 'sinatra/reloader' if development?
require "bundler/setup"
require 'pry'


blog = Blog.new
blog.add_post Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
blog.add_post Post.new("The second blog post", "10-02-2001", "This is the second blogpost, I hope you like it very much", false, "Reinier", "Test")
blog.add_post Post.new("The third blog post", "10-02-2002", "This is the third blogpost, I hope you like it very much", false, "Reinier", "Test")

get "/" do
	
	posts = blog.posts	
	
	erb :home, :locals => {:posts => posts}

end


get "/post_details:index" do

	post = blog.posts[params["index"].split(':')[1].to_i]

	erb :view_post, :locals => {:post => post}

end

get "/new_post" do

	erb :create_new_post, :locals => {:blog => blog}

end


get "/create_new_post" do

	blog.add_post Post.new(params["title"],Time.now.to_s.split(' ')[0], params["content"], false)

	redirect('/')
end
