class Car

	def initialize (noise_car, engine)
		@noise = noise_car
		@engine = engine
	end

	def makeNoise
		puts @noise
		puts @engine.makeNoise
	end
end

class Engine

	def initialize (noise)
		@noise = noise
	end

	def makeNoise
		puts @noise
	end

end


engine = Engine.new("vroemvroem")
car = Car.new("broom", engine)

car.makeNoise