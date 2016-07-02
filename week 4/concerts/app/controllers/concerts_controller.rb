class ConcertsController < ApplicationController

	def index
		@concerts = Concert.all
		@todays_concerts = @concerts.where("date <= ?", Time.now.end_of_day)
	end

	def create
	
	end

	def new
	
	end

end
