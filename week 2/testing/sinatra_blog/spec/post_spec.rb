require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/blog.rb'
require '/Users/reinierverbeek/ironhack/prework/testing/sinatra_blog/lib/post.rb'


describe Post do

	

	describe '#text' do

		it "Should return an array of posts" do
			
			post = Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
			
			expect(post.text).to eq ("This is the very first blogpost, I hope you like it very much")
		end 

	end

	describe '#category' do

		it "Should return the category of the post" do
			
			post = Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
			
			expect(post.category).to eq ("Test")
		end 

	end

	describe '#author' do

		it "Should return the author of the post" do
			
			post = Post.new("The first blog post", "10-02-2000", "This is the very first blogpost, I hope you like it very much", false, "Reinier", "Test")
			
			expect(post.author).to eq ("Reinier")
		end 

	end



end

