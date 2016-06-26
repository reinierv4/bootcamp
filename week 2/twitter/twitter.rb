
#puts text[0].split(":")[0]
class User
	
	attr_accessor :name, :text, :mentiones, :second_degree, :first_degree, :mentioned_by
	
	def initialize (name, text)
		@name = name
		@text = text
		@mentiones = []
		@second_degree = []
		@first_degree = []
		@mentioned_by = []
	end

	def addMentionings
		
		help_array = @text.split('@')
		
		help_array.each_with_index do |item, index|
		
			@mentiones.push(item.split(' ')[0]) if index>0
			
		end

	end
end

users = []


text_pre = IO.read("sample_input.txt")
text = text_pre.split(/\r?\n/)

text.each do |sentence|
	
	#Check first if user exists, if so add, else create new user
	user_new = true
	
	users.each do |user|
		if user.name == sentence.split(":")[0]
			user.text = user.text + "  " + sentence.split(":")[1].gsub('.','').gsub('?', '').gsub(',', '')
			user_new = false
		end
	end
	if user_new
		if sentence.split(":").length>1
			name = sentence.split(":")[0]
			text = sentence.split(":")[1].gsub('.','').gsub('?', '').gsub(',', '')
			new_user = User.new(name,text)
			users.push(new_user)
		end
	end
end


users.each do |user|
	user.addMentionings
end


users.each do |user|
	
	
	
	user.mentiones.each do |mentions|
		
	 	other_user = users.select{|user| user.name == mentions}[0]
	 	
	 	unless other_user == nil
	 		if other_user.mentiones.include?user.name
	 			user.first_degree.push(other_user.name)
			else
				user.second_degree.push(other_user.name)
	 		end
	 	end
	 end

end




 users.each do |user|
	
 	if user.second_degree.length > 0
 		
 		user.second_degree.each do |user_second|
 			
 			puts "This is user #{ user.name } with #{ user_second }"
 			other_user = users.select{|find_user| find_user.name == user_second}[0]
 			other_user.mentioned_by.push(user.name)
 		
 		end
 	end
 end

users.each do |user|
 	puts user.name
 	puts "first degree: #{user.first_degree.join(", ")} "
 	puts "second degree: #{user.second_degree.join(", ")} "
 	puts "mentioned by: #{user.mentioned_by.join(", ")}"

end

(1..10).each do |index|

	if movie_rating.each do 



(0..movie_array.length-1). do |index[0]






