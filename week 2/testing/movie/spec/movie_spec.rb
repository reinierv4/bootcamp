require_relative '../lib/movie.rb'
require_relative '../lib/fake_movies.rb'
require_relative '../lib/movie_container.rb'

RSpec.describe Movie do

	let(:selected) do
		instance_double()
	let(:movies) {FakeMovies.new.fake_movies}

	it "checks if the selected movie was the movie with the highest rating in the list" do

		expect(Movie.rating_selected_movie(movies,selected.title)).to eq(selected)
	
	end

end