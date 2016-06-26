
class Item 
  def initialize(name, price)
      @name = name
      @price = price
  end

  def price
      @price
  end
end

class Houseware < Item
  
  def price
      if @price > 100
      	discounted_price = 0.95 * @price
      end
      discounted_price
	end
end


class Fruit < Item
  
  def price
    #Check if today is a saturday or sunday
    if Time.now.wday > 5 
    	discounted_price = 0.9 * @price
    end
    discounted_price
	end
end


class ShoppingCart
  
  def initialize
      @items = []
  end

  def add_item(item)
      @items.push(item)
  end

  def checkout 
  	total_price = 0
  	@items.each do |item|
  		total_price += item.price
  	end
  	if @items.length > 5
  		total_price = total_price * 0.9
  	end
  	puts "Your total is $#{total_price} have a nice day!"
  end

end

joshs_cart = ShoppingCart.new

banana = Fruit.new("Banana", 10)
vaccuum = Houseware.new("Vaccuum", 150)
oj = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)

joshs_cart.add_item(oj)
joshs_cart.add_item(rice)
joshs_cart.checkout

