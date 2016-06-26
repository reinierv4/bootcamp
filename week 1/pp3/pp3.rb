require "imdb"
puts Ghostbusters = Imdb::Search.new("Ghostbusters").movies[20].rating

# movie = Ghostbusters.select do |movie|
# 	movie.year == "2010"
# end

# puts movie.title

rating.class.name == "Float"