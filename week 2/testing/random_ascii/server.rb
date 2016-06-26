require 'sinatra'
require 'artii'
require 'sinatra/reloader' if development?




get '/ascii/:one_random_word' do 

	@art = Artii::Base.new :font => 'slant'

	@one_random_word = params[:one_random_word].to_s
	
	erb :display
end


get '/ascii/:one_random_word/:type' do 

	@art = Artii::Base.new :font => params[:type].to_s

	@one_random_word = params[:one_random_word].to_s
	
	erb :display
end

get '/secret' do 

	erb :unicorn
end