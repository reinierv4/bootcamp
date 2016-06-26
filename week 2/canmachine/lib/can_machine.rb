require 'pry'
class CanMachine
	attr_accessor :stock, :product_prices, :balance, :selection, :maximum_stock
	
	def initialize
		@stock = {
			cola: 0,
			fanta: 0,
			sprite: 0,
			water: 0
		}
		@product_prices = {
			cola: 2.00,
			fanta: 1.80,
			sprite: 1.75,
			water: 1.55
		}
		@balance = 0.00
		@selection = :empty
		@maximum_stock = 10
	end

	def dispense
		if enough_funds? && enough_stock?
			@stock[@selection] -= 1
			@balance -= @product_prices[@selection]
		else
			false
		end
	end

	def enough_stock?
		 if @selection == :empty || @stock[@selection] < 1
		 	
		 	false
		 else
		 	true
		 end
	end

	def can_stock
		sum = 0 
		@stock.each {|key,value| sum += value.length}
		sum
	end

	def fill_up
		@stock.each {|key,value| @stock[key] = @maximum_stock}
	end

	def enough_funds?

		if @selection == :empty || @product_prices[@selection] >= @balance
		 	false
		 else
		 	true
		 end
		
	end

end