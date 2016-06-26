class MovieContainer
attr_accessor :movies
	def initialize

		@movies  = [FakeMovies.shank,FakeMovies.batman,FakeMovies.pulp,FakeMovies.forrest,
			FakeMovies.seven,FakeMovies.gladiator,FakeMovies.django,FakeMovies.reservoir,FakeMovies.scarface]
	end


end
