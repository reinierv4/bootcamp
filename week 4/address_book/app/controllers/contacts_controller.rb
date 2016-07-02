	class ContactsController < ApplicationController

	def new
		render 'new'
	end

	def create

		contact = Contact.new
		contact.name = params[:contact][:name]
		contact.address = params[:contact][:address]
		contact.phone = params[:contact][:phone]
		contact.email = params[:contact][:email]
		contact.save

		redirect_to("/contacts")

	end

	def index

		@contacts = Contact.all.order('name ASC')
		render 'contacts'
	end

	def information

		id = params[:id]
		@contact = Contact.find(id)
		render 'information'

	end

	def favourite
		
		id = params[:id]
		contact = Contact.find(id)
		new_value = !contact.favourite
		contact.update_attribute("favourite", new_value)
		@contacts = Contact.all.order('name ASC')
		redirect_to("/contacts")
	end

	def show_favourites

		@contacts = Contact.where(favourite: true).order('name ASC')
		render 'favourite_contacts'

	end
	
	def filtered
		
		search = params[:search_value]
		@contacts = Contact.where("lower(name) LIKE '#{search.downcase}%'").order('name ASC')
		render 'contacts'

	end



end
