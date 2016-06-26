=begin
This is a function that takes a word or sentence and a number "x" 
to convert the secret message by shifting "x" chars in alphabet
=end


def solve_cipher(input,shift_number=3)
	
	#Add logic for shift numbers higher than 26
	if shift_number > 26 || shift_number < -26
		shift_number = shift_number%26
	end

	#Prepare input for transformation
	word_array=input.downcase.chars
	message_array=[""]

	#Convert message
	for letter in word_array
		#If char is special character don't convert
		if [" ", ".", "!","?"].include? letter
			message_array<<letter
		#If character is "lower than" a (97), start at z
		elsif (letter.ord+shift_number) < 97 
			message_array<<(26+letter.ord+shift_number).chr
		#If character is "higher than" z (122), start at a
		elsif (letter.ord+shift_number) > 122
			message_array<<(letter.ord+shift_number-26).chr 
		else
			message_array<<(letter.ord+shift_number).chr
		end
	end

	puts message_array.join

end

solve_cipher("p| uhdo qdph lv grqdog gxfn!", -29)