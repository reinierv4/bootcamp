
def word_sort(sentence)
	word_array=sentence.gsub(/[^a-z0-9\s]/i, '').split.sort_by { |word| word.downcase }
	puts word_array
end

word_sort("Have a nice day.")
puts '/////////////////////////'
word_sort("Ruby is a fun language!")
puts '/////////////////////////'
word_sort("Fools fall for foolish follies.")