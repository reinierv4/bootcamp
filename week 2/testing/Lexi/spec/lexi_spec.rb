require 'spec_helper'




describe Lexiconomitron do 
  
  before :each do
  	@lexi = Lexiconomitron.new
  end


  describe "#eat_t" do

    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  
  end

  describe "#shazam" do

    it "removes every letter t from the input" do
      expect(@lexi.shazam(["This", "is","a","boring","test"])).to eq(["sih","se"])
    end
  
  end

  describe "#oompa_loompa" do

  	it "takes a array of words and returns words with three chars or less without t's" do
  		expect(@lexi.oompa_loompa(["This","is","the","first","test"])).to eq(["is","he"])
  	end

  	it "takes a array of words and returns words with three chars or less without t's" do
  		expect(@lexi.oompa_loompa(["ttt","est","tt","ting"])).to eq(["es"])
  	end
  end
end