require 'pry'

class ShoppingCart
attr_accessor :counts

	def initialize(day, season)
		@products = []
		@counts = Hash.new 0
		@day = day.downcase
		@season = ["spring","summer","fall","winter"].find_index(season.downcase)

	end

	def show

		
		@products.each do |product|
  			@counts[product.name] = [@counts[product.name][0]+1,product]
  			
  		end
		
		@counts.each do |key, value|
  			if value[0]>1
  				puts "#{value[0]}: #{value[1].plural}: #{value[0]*value[1].price[@season]}$"
  			else
  				puts "#{value[0]}: #{value[1].name}: #{value[0]*value[1].price[@season]}$"
  			end
  		end

  		@counts
	end

	def calculateDiscount
		 discount = 0
		
		if @counts["apple"][0]!=nil && @counts["apple"][0]>1
			discount += (@counts["apple"][0]/2).floor * @counts["apple"][0].price[@season]
		end

		if @counts["orange"][0]!=nil && @counts["oranges"][0]>2
			discount += (@counts["orange"][0]/3).floor * @counts["orange"][0].price[@season]
		end

		if @counts["grapes"][0]!=nil && @counts["grapes"][0]>3 && @counts["banana"][0]!='nil'

			bananas_for_free = (@counts["orange"][0]/4).floor
			discount += [@counts["banana"][0], bananas_for_free].min * @counts["banana"][0].price[@season]
		end
		
		if @counts["watermelon"][0]!=nil && @counts["watermelon"][0]>0 
			discount += -@counts["watermelon"][0] * @counts["watermelon"][0].price[@season]
		end

		discount
	end


	

	def cost

		total = @products.reduce(0) do |sum, value|
			
			sum + value.price[@season]
		end
		puts "Total payable #{total}$"
	end



	def add_item_to_cart(product)
		@products.push(product)
	end
end

class Product

	attr_accessor :name, :price

	def initialize(name,price)
		@name = name
		@price = price
	end
end

class Apple < Product
	attr_accessor :plural
	def initialize
		super("apple", [10,10,15,12])
		@plural = "apples"
	end
end

class Banana < Product
	attr_accessor :plural
	def initialize
		super("banana", [20,20,20,21])
		@plural = "bananas"
	end
end

class Oranges < Product
	attr_accessor :plural
	def initialize
		super("orange", [5,2,5,5])
		@plural = "oranges"

	end
end

class Grapes < Product
	attr_accessor :plural
	def initialize
		super("grapes", [15,15,15,15])
		@plural = "grapes"
	end
end

class Watermelon < Product
	attr_accessor :plural
	
	def initialize
		super("watermelon", [50,50,50,50])
		@plural = "watermelons"
	end
end








cart = ShoppingCart.new("monday", "winter")

cart.add_item_to_cart Apple.new
cart.add_item_to_cart Banana.new
cart.add_item_to_cart Banana.new




cart.show
cart.cost
puts cart.calculateDiscount
