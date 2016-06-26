require_relative '../lib/spider.rb'

RSpec.describe Spider do
 
 

 it "gives the first website from google" do
   expect(Spider.search("http://www.google.com/search?q=whatever")).to include "www"
end
end
