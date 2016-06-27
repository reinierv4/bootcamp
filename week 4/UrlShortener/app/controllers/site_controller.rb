class SiteController < ApplicationController

	def generateRandom(number)
		(0...number).map { ('a'..'z').to_a[rand(26)] }.join
	end

	@@linkhash = {}
	@@pages_visited = {}


	def welcome

		@linkhash = @@linkhash
		@pages_visited = @@pages_visited
		render 'welcome'

	end

	def link_constructor

		if params[:link].include? 'http'
			unless @@linkhash.value? params[:link]
				@@linkhash[generateRandom(3)] = params[:link] 
				@@pages_visited[params[:link]]={"visited" => 0, "created" => Time.new.inspect}
			end
		else
			unless @@linkhash.value? 'http://' + params[:link]
				@@linkhash[generateRandom(3)] = 'http://' + params[:link] 
				@@pages_visited['http://' + params[:link]] = {"visited" => 0, "created" => Time.new.inspect};
			end
		end
		@linkhash = @@linkhash
		@pages_visited = @@pages_visited
		render 'welcome'

	end




	def linkconverter
		
		@@pages_visited[@@linkhash[params[:something]]]["visited"] += 1

		redirect_to @@linkhash[params[:something]]

	end

	
	
end

