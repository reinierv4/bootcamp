
class Ingredient
	attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class MilkShake

   def initialize
    @base_price = 3
    @ingredients = [ ]    
  end

  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def price_of_milkshake
  #Create counter to keep track of total prize
  total_price_of_milkshake = @base_price
  #Add each ingredients price to our total
  @ingredients.each do |ingredient|
    total_price_of_milkshake += ingredient.price
  end
  #return  our total price to whoever called for it
   total_price_of_milkshake
end
end

class ShakeShop

	def initialize
		@milkshakes = [ ]
	end

	def add_miklkshake (milkshake)
		@milkshakes.push(milkshake)
	end

	def checkout
		total_price = 0
		@milkshakes.each do |milkshake|
			total_price += milkshake.price_of_milkshake
		end

		puts "The total price is #{total_price}"
	end
end




