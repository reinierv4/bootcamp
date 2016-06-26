require 'sinatra'
require 'sinatra/reloader' if development?
require "bundler/setup"
require 'pry'
require 'imdb'

require '/Users/reinierverbeek/ironhack/prework/testing/movie/lib/movie.rb'


movies = Imdb::Search.new("Tor").movies

get '/' do 

	erb :home
	
end

get '/search_imdb' do 

	movies = Imdb::Search.new(params["search"]).movies
	
	movies.select! do |movie|
		movie.rating.class == Float
	end
	
	movies.sort_by {|movie| -movie.rating}

	@movies = movies[0..8]

	erb :display_results

	
end

get '/check_answer' do 

	if Movie.checkRating(movies,params["movie"])
		"Your answer is correct"
	else
		"Your answer is wrong"
	end
end