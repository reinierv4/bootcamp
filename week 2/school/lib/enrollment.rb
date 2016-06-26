require_relative 'school.rb'
require_relative 'student.rb'
require_relative 'teacher.rb'
require_relative 'enrollment.rb'

class Enrollment
attr_accessor :student, :course 
	
	def initialize(course, student)
		@student = student
		@course = course
	end
end
