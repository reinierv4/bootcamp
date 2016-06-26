class Calculator
	

	@@last_result = 0

	def self.last_result
		@@last_result
	end


	def self.add(number1, number2)

		@@last_result = number1+number2
		"The result of adding #{number1} and #{number2} = #{number1+number2}"

	end

	def self.substract(number1, number2)

		@@last_result = number1+number2
		"The result of substracting #{number1} and #{number2} = #{number1-number2}"

	end

	def self.multiply(number1, number2)

        @@last_result = number1*number2
		"The result of multiplying #{number1} and #{number2} = #{number1*number2}"

	end

	def self.divide(number1, number2)

		@@last_result = number1/number2
		"The result of dividing #{number1} and #{number2} = #{number1/number2}"

	end

	def self.calculate_with_instruction(number1,number2,operation)
		case operation
  		when "add"
  			Calculator.add(number1,number2)
  		when "substract"
	  		Calculator.substract(number1,number2)
		when "multiply"
	  		Calculator.multiply(number1,number2)
		when "divide"
	  		Calculator.divide(number1,number2)
  		end
  	end


end


