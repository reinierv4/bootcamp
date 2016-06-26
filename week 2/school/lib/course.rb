require_relative 'school.rb'
require_relative 'student.rb'
require_relative 'teacher.rb'
require_relative 'enrollment.rb'

require 'date'

class Course 
	attr_accessor :name, :start_date, :end_date, :teacher, :enrollments
	def initialize (name, start_date, end_date, teacher)
   	@name = name
   	@start_date = Date.parse(start_date)
   	@end_date = Date.parse(end_date)
   	@teacher = teacher
   	@enrollments = []
   
 	end

	def add_enrollment(enrollment)
 		@enrollments << enrollment

 	end

 	def getStudentList
 		students = []
 		enrollments.each {|enrollment| students << enrollment.student}
 		students
 	end

end


