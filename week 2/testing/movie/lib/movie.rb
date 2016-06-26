class Movie

	# def self.check_rating_question (movies, selected)
	# 	max = highest_rating(movie)
	# 	selected_movie = rating_selected_movie(movies,selected)
	# 	selected_movie.rating >= max ? true : false
	# end
	
	# def self.highest_rating(movie)
	#   max = 0
	# 	movies.each do |movie|
	# 		max = movie.rating if movie.rating > max 
	# 	end
	# end

	def self.rating_selected_movie(movies,selected)
		selected_movie = movies.find {|movie| movie.title == selected}
	end

end
