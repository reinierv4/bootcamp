require "sinatra"
require "/Users/reinierverbeek/ironhack/prework/testing/Sinatra/calculator.rb"
require "/Users/reinierverbeek/ironhack/prework/testing/Sinatra/time.rb"

get "/add" do
  
	erb(:add)
end

post "/calculated" do
  
  number1 = params[:first_number].to_f
  number2 = params[:second_number].to_f
  operation = params[:operation].to_s
  text = Calculator.calculate_with_instruction(number1,number2,operation)

  # "#{text}
  # <input type='checkbox' name= 'saved'>
		# <button type='submit' name='operation' value='add' >New Calculation</button>"
  
  erb :result, :locals => {:text => text}

end

get "/new_calculation" do
  	
  	
  	if params["saved"] == "true"
  		first_number = Calculator.last_result
  	else
  		first_number = "1st number"
  	end

  	erb :new_calculation, :locals => {:first_number => first_number}
end

get "/time" do
  	
  	case params["city"]
	when "New York"
		time = Time.now-6*3600
	when "Madrid"
		time = Time.now
	when "Tokyo"
		time = Time.now+8*3600
	else
		time = Time.now
	end

	"The current time in #{params["city"]} is #{time}"
end


get "/countup" do
  	
  	

  	erb :count_down, :locals => {:number => params["number"].to_i}



end






