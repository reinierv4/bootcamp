require_relative 'teacher.rb'
require_relative 'enrollment.rb'
require_relative 'person.rb'

class Student < Person
 attr_accessor :name, :age, :enrollments

	def initialize (name, age)
		super
		@enrollments = []
	end

	def add_enrollment (enrollment)
		@enrollments << enrollment
	end

	def getCourseList
 		courses = []
 		enrollments.each {|enrollment| courses << enrollment.course}
 		courses
 	end

end
