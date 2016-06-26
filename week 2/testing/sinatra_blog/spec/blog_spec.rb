require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/blog.rb'
require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/post.rb'


describe Blog do

	

	describe '#posts' do

		it "Should return an array of posts" do
			
			my_blog = Blog.new
			my_blog.add_post Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
			my_blog.add_post Post.new("The second blog post", "10-02-2001", "This is the second blogpost, I hope you like it very much", false , "Reinier", "Test")
			my_blog.add_post Post.new("The third blog post", "10-02-2002", "This is the third blogpost, I hope you like it very much", false, "Reinier", "Test")
		
			expect(my_blog.posts.class).to be (Array)
			expect(my_blog.posts[0].class).to be (Post)
		end 

		
	
	end

	describe '#latest_posts' do

		it "Should show the latest post first" do
			
			my_blog = Blog.new
			my_blog.add_post Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
			my_blog.add_post Post.new("The second blog post", "10-02-2001", "This is the second blogpost, I hope you like it very much", false, "Reinier", "Test")
			my_blog.add_post Post.new("The third blog post", "10-02-2002", "This is the third blogpost, I hope you like it very much", false, "Reinier", "Test")
		
			expect(my_blog.latest_posts[0].date > my_blog.latest_posts[1].date).to be true
			expect(my_blog.latest_posts[1].date > my_blog.latest_posts[2].date).to be true
			expect(my_blog.latest_posts[0].date > my_blog.latest_posts[2].date).to be true

		end 
	end






end
