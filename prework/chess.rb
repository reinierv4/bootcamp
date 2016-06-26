class Board 
	
	attr_accessor :grid

	
	
	# @@grid =[["bR","bN","bB","bQ","bK","bB","bN","bR"],
	#  	 	["bP","bP","bP","bP","bP","bP","bP","bP"],
	#  		["--","--","--","--","--","--","--","--"],
	#   			["--","--","--","--","--","--","--","--"],
	#   			["--","--","--","--","--","--","--","--"],
	#   			["--","--","--","--","--","--","--","--"],
	#   			["wP","wP","wP","wP","wP","wP","wP","wP"],
	#   			["wR","wN","wB","wQ","wK","wB","wN","wR"]]

	 @@grid = [["bK","--","--","--","--","bB","--","--"],
	 			["--","--","--","--","--","bP","--","--"],
				["--","bP","wR","--","wB","--","bN","--"],
	 			["wN","--","bP","bR","--","--","--","wP"],
	 			["--","--","--","--","wK","wQ","--","wP"],
	 			["wR","--","bB","wN","wP","--","--","--"],
	 			["--","wP","bQ","--","--","wP","--","--"],
	 			["--","--","--","--","--","wB","--","--"]]


	def self.returnPawn(field)
		
		position_in_grid = Move.convertPosition(field)
		@@grid[position_in_grid[0]][position_in_grid[1]]
	
	end

end

class Piece

	attr_accessor :color

	def initialize(color, letter)
		@color = color
		@position = []
		@symbol = (color + letter).to_sym
	end

end

class Rook < Piece

	attr_accessor :steps, :movement

	def initialize(color)
		super(color,"R")
		@movement = ["vertical", "horizontal"] 
		@steps = (1..8)
	end
end

class Pawn < Piece
	attr_accessor :steps, :movement

	def initialize(color)
		super(color,"P")
		@movement = ["vertical"] 
		@steps = (1..2)
	end
end

class Knight < Piece
	attr_accessor :steps, :movement
	def initialize(color)
		super(color,"N")
		@movement = ["horse"]
		@steps = (1..8) 
	end
end

class Bishop < Piece
	attr_accessor :steps, :movement
	def initialize(color)
		super(color,"B")
		@movement = ["diagonal"] 
		@steps = (1..8)
	end
end

class Queen < Piece
	attr_accessor :steps, :movement
	def initialize(color)
		super(color,"Q")
		@movement = ["vertical", "horizontal", "diagonal"] 
		@steps = (1..8)
	end
end

class King < Piece
	attr_accessor :steps, :movement
	def initialize(color)
		super(color,"K")
		@movement = ["vertical", "horizontal", "diagonal"] 
		@steps = (1..1)
	end
end

require 'pry'
class Move 

	attr_accessor :start, :finish

	def initialize (start, finish)
		@start = start
		@finish = finish

	end

	def self.convertPosition(field)


		position = []
		letter = field[0]
		number = field[1]
		position[0] = (7-(number.to_i-1))
		position[1] = (letter.ord-97)
		position
	
	end

	
	def steps(position1, position2, color)

		
		vertical_movement = (position2[0]-position1[0]).abs
		
		horizontal_movement = position2[1]-position1[1]

		if color == "w"
			vertical_movement = -vertical_movement
		end

		movement_array = [horizontal_movement.abs, vertical_movement.abs]
		movement_array
	
	end


	def direction(movement_array)
		
		direction = ""

		
		#position 0 is horizontal movement, 1 vertical
		if movement_array[0]>0 && movement_array[1]>0 && (movement_array[0] + movement_array[1] == 3 && (movement_array[0]==1 || movement_array[1] ==1) && movement_array[0]!=movement_array[1])
			direction = "horse"
		elsif movement_array[0]>0 && movement_array[1]>0 && movement_array[0] == movement_array[1]
			direction = "diagonal"
		elsif movement_array[0]>0 && movement_array[1]==0
			direction = "horizontal"
		elsif movement_array[0]==0 && movement_array[1]>0
			direction = "vertical"
		else
			direction = "illegal"
		end
		
		direction
	end
end

class MoveValidator

	def initialize
		@moves = Move.moves
	end


end


class MoveReader

	attr_accessor :moves, :board, :start, :finish

	def initialize
		@board = []
		@moves = []
		@start = []
		@finish = []
	end

	def ReadBoard
		@board = IO.readlines("simple_board.txt")
	end

	
	def ReadMoves
		@moves = IO.readlines("simple_results.txt")
		convertMoves
	end

	def convertMoves
		@moves.each do |move|
			
			@start.push(move.split[0])
			@finish.push(move.split[1])
		end
	end

end

class MoveValidator

	attr_accessor :result_array
	def initialize (move)
		@move = move
		@move_array = [move.start, move.finish]
		@result_array = []
	end

	def checkMove

		

		@move_array.transpose.each do |move_iterator|
			
			start = move_iterator[0]
			finish = move_iterator[1]
			
			piece_code = Board.returnPawn(start)

		
			
			case piece_code[1]
			when "R"
				piece = Rook.new(piece_code[0])
			when "P"
				piece = Pawn.new(piece_code[0])
			when "N"
				piece = Knight.new(piece_code[0])
			when "B"
				piece = Bishop.new(piece_code[0])
			when "Q"
				piece = Queen.new(piece_code[0])
			when "K"
				piece = King.new(piece_code[0])
			when "-"
				result_array.push("ILLEGAL")
				next
			else
				puts "unknown pawn"
				exit
			end
			
			
			move_direction = @move.direction(@move.steps(Move.convertPosition(start), Move.convertPosition(finish), piece.color))
			
			move_steps = @move.steps(Move.convertPosition(start), Move.convertPosition(finish), piece.color).max
			
			
			if piece.movement.include?(move_direction) && piece.steps.include?(move_steps)
				result_array.push("LEGAL")
			else
				result_array.push("ILLEGAL")
			end
		end

		
	end

end





movereader = MoveReader.new

movereader.ReadBoard
movereader.ReadMoves

move_valdiator = MoveValidator.new(Move.new(movereader.start, movereader.finish))

move_valdiator.checkMove

puts move_valdiator.result_array






