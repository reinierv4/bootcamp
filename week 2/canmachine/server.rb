require 'sinatra'
require 'sinatra/reloader' if development?
require 'net/http'


require_relative 'lib/can_machine.rb'
require_relative 'lib/can.rb'
require_relative 'lib/spider.rb'

@@machine = CanMachine.new
@@info_message = "Please insert coins to buy a product"

get '/index' do 

	
	erb :show_machine
end

get '/selected/:value' do 


	@@machine.selection = params[:value].to_sym
	if @@machine.enough_stock?
		@@info_message = "You selected: #{@@machine.selection}"
		redirect ('/index')
	else
		@@info_message = "Sorry, there is no more #{params[:value]}"
		redirect ('/index')
	end

end

get '/price_request/:value' do 
	@@machine.product_prices.class
	@@info_message = "The price is:#{@@machine.product_prices[params[:value].to_sym]}"
	redirect ('/index')
end

get '/dispense' do 

	if @@machine.dispense
		@@info_message = "Here is your #{@@machine.selection} "
		redirect ('/index')
	else
		@@info_message = "Not enough funds, insert money"
		redirect ('/index')
	end

end

get '/fillmachine' do 
	@@machine.fill_up
	@@info_message = "The machine is now filled up!"
	redirect ('/index')
end

get '/balance' do 

	
	@@info_message = "The current balance is #{@@machine.balance}"
	redirect ('/index')
end

get '/insertcoin' do 

	increase = params['money']
	@@machine.balance += increase.to_f
	@@info_message = "Added #{params["money"]}, balance: #{@@machine.balance}"
	redirect ('/index')
end

get '/read_my_mind' do 
	
	redirect(Spider.search("https://www.google.es/search?q=" + params["search"]))

end