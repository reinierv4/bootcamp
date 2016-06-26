require_relative '../lib/can_machine.rb'
require_relative '../lib/can.rb'

RSpec.describe CanMachine do
 
 before :each do 
 	@machine = CanMachine.new
 end


 it "give cans" do
   expect(@machine.dispense).to be false
 end
 
 it "checks balance for enough amount" do
   expect(@machine.enough_funds?).to be false
 end
 
 it "checks stock" do
   expect(@machine.enough_stock?).to be false
 end
 
it "should start with no cans" do
   expect(CanMachine.new.can_stock).to be(0)
 end
 
 it "should start with maximum_stock of 10" do
   expect(CanMachine.new.maximum_stock).to be(10)
 end
 
 it "can be filled up to stock" do
   @machine.fill_up
   expect(@machine.can_stock).to eq(@machine.maximum_stock*@machine.stock.size)
 end

 it "returns the price of the product" do

 	expect(@machine.product_prices[:cola]).to be_within(1.50).of(3.00)

 end



end