for x in 1..100 do
	
	result=""
	changed_text=false
	if x%3==0
		result << "Fizz"
		changed_text=true
	end
	if x%5==0
		result << "Buzz"
		changed_text=true
	end
	if x==1 || x>9 && x<20
	    result << "Bang"
	    changed_text=true
	end
	if changed_text 
		puts result
	else
		puts x
	end

end

