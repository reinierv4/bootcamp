# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

reinier = Contact.new(name: 'Reinier Verbeek',
			address: 'Geerdinkhof 415',
			phone: '+31641357836',
			email: 'reinierv4@hotmail.com')
reinier.save