class Space
	attr_accessor :description, :exits_neighbours, :name, :game

	def initialize (description, name)

		@description = description + " exits: "
		@exits_neighbours = {}
		@name = name
		@game
	end
end


class GameState
	attr_accessor :room, :items
	
	def initialize (room1_name)
		@room = room1_name
		@items = []
	end

	def room
		@room
	end
end




class Room < Space

	def initialize(description, name)
		super
	end

	def openroom
		puts @description
		command = gets.chomp
		executeCommand(command)
	end

	def executeCommand(command)
		
		if command == "exit"
			
			save_text = "#{game.room.name} "
			
			game.items.each do |item|
				save_text = save_text + item
			end

			puts save_text

			IO.write("gamestate.txt", save_text)

			exit
		end

		
		to_do = true
		#Check if the command is an item or a 
		case command
		when "Pick up a Sword"
			items.push("Swoard")
			to_do = false
		when "Pick up a Knive"
			items.push("Knive")
			to_do = false
		end

		if @exits_neighbours[command] == "escape"
			puts "You escaped"
			exit
		elsif @exits_neighbours[command].nil?
			puts "There is no exit there.. Try Again!"
			command = gets.chomp
			executeCommand(command)	
		elsif to_do
			
			game.room = @exits_neighbours[command].name
			puts @exits_neighbours[command].name
			@exits_neighbours[command].openroom
		end
	
	end

	def setExits(exits)
		
		@exits_neighbours = exits

		@exits_neighbours.each do |key,value|
			@description = @description + key + " "
		end

	end


end


sentence = ["There is a sword in the room, type Pick up a Sword, to pick it up!","There is a knive in the room, type Pick up a Knive, to pick it up!"]	

room1 = Room.new("welcome in room 1", "room1")
room2 = Room.new("welcome in room 2", "room2")
room3 = Room.new("welcome in room 3", "room3")
room4 = Room.new("welcome in room 4", "room4")
room5 = Room.new("welcome in room 5", "room5")

room_array = [room1,room2,room3,room4,room5]

room1.setExits({"N" => room2 })
room2.setExits({"E" => room3, "W" => room4, "S" => room1 })
room3.setExits({"W" => room2})
room4.setExits({"E" => room2, "W" => room5})
room5.setExits({"E" => room4 , "W" => "escape"})

gamestate = IO.read("gamestate.txt").split(' ')


case gamestate[0]
when "room1"
	game = GameState.new(room1)
	
when "room2"
	game = GameState.new(room2)
	
when "room3"
	game = GameState.new(room3)
	
when "room4"
	game = GameState.new(room4)
	
when "room5"
	game = GameState.new(room5)
	
else
	puts "unknown gamestate, program is closed"
	exit
end


if gamestate.length > 1
	(1..gamestate.length).each do |index|
		items.push(gamestate[index])
	end
end


room_array.each do |room|
	room.game = game
end



game.room.openroom

