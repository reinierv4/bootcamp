
require_relative '../lib/can.rb'

RSpec.describe Can do

	before :each do 

		@can = Can.new("cola",1.50)

	end

	it "Should return the price" do

		expect(@can.price).to eq(1.50)
	end

	it "should return the name" do
		expect(@can.name).to eq("cola")
	end

end



