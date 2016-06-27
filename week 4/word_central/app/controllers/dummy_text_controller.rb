class DummyTextController < ApplicationController

	def new
		render 'new'
	end

	def create
		
		@number = params[:quantity].to_i
		
		paragraph = "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing."
		words = paragraph.split(" ")
		@text = ""
		if params[:type_of_text] == "paragraph"
			(@number).times do 
				@text += paragraph
			end
		else
			index = 0
			while index < @number
				@text = @text + words[index] + " " 
				index += 1
			end
		end

		render 'result'
	end

end
