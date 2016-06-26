class Lexiconomitron
	
	def eat_t(sentence)
		
		return sentence.gsub("t","").gsub("T","")

	end

  def shazam word_array

    word_array.map! do |word|
      word.reverse
    end

    [eat_t(word_array[0]),eat_t(word_array[word_array.length-1])]
    
  end


  def oompa_loompa word_array

    selected_words = word_array.select do |word|

      word.length<=3
    
    end

    selected_words.map! do |word|
      eat_t(word)
    end

    selected_words = selected_words.reject { |field| field.empty? }
    selected_words
  
  end




end







