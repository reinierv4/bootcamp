class AsciisController < ApplicationController

	def new
		render 'asciis'
	end

	def create

		@text = params[:ascii][:user_text]
		a = Artii::Base.new :font => 'slant'
		@ascii_text = a.asciify(@text)


		render "results"
	
	end


end
