require 'imdb'
class FakeMovies
attr_accessor :shank, :fake_movies
	

	def initialize
	
		@fake_movies = []
		@shank = Imdb::Movie.new("0111161")
		@fake_movies << @shank
		@batman = Imdb::Movie.new("0468569")
		@fake_movies << @batman
		@pulp = Imdb::Movie.new("0110912")
		@fake_movies << @pulp
		@forrest = Imdb::Movie.new("1375666")
		@fake_movies << @forrest
		@seven = Imdb::Movie.new("0114369")
		@fake_movies << @seven
		@gladiator = Imdb::Movie.new("0172495")
		@fake_movies << @gladiator
		@django = Imdb::Movie.new("1853728")
		@fake_movies << @django
		@reservoir = Imdb::Movie.new("0105236")
		@fake_movies << @reservoir
		@scarface = Imdb::Movie.new("0086250")
		@fake_movies << @scarface
		#@@movies = [@@shank,@@batman,@@pulp,@@forrest,@@seven,@@gladiator,@@django,@@reservoir,@@scarface]
	end	
		

end


