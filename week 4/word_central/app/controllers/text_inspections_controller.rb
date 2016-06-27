class TextInspectionsController < ApplicationController

	def new
		render 'new'
	end

	def create
		@text = params[:text_inspection][:user_text]
		@text_stripped = @text.gsub(/[^a-zA-Z\s.]/,'').strip 
		@word_count = @text.split(" ").length
		@reading_time = @word_count/(275/60)
		@word_count_hash = @text_stripped.split(" ").reduce(Hash.new(0)) { |h,w| puts h[w] += 1; h }
		@word_count_hash = @word_count_hash.sort_by {|key, value| -value}.to_h
		@word_count_hash = @word_count_hash.first 10
		render "results"
	end
end
