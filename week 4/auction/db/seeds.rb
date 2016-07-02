["fernanda","magnus","satwat"].each do |name|
	user = User.create(
		name: name,
		email: "#{name}@hotmail.com", 
		password: '12345'
		)

		product = user.products.create(
					title: "#{name} magic",
					description: "New and very good",
					minimum_price: 2,
					deadline: (Date.today + rand(10).days)
				)

		(3..10).each do |bid|
			bid = product.bids.create(
				ammount: bid,
				user_id: 2
				)
		end
	
	end

		