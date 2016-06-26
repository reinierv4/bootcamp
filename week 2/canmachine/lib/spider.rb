require 'net/http'
require 'nokogiri'
require 'open-uri'

class Spider

	def self.search(string)

		
		doc = Nokogiri::HTML(open(string))
		arr = []
		doc.css('h3.r a').each do |link|
			arr << link["href"]
		end
		first_link = arr.find {|string| string.start_with?'/url?q=http'}.split('/url?q=')[1].split('&sa=U&ved=0ahU')[0]

	end

end





