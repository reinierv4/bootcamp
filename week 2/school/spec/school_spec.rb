require_relative '../lib/school.rb'
require_relative '../lib/student.rb'
require_relative '../lib/teacher.rb'
require_relative '../lib/course.rb'


RSpec.describe School do
 
 before :each do 
 	@ironhack = School.new("IronHack")
 end

 describe "#new" do

 	it "it creates a school with a name" do
 		expect(@ironhack.name).to eq("IronHack")
 	end


 end

 describe "#add_student"
 	student = double('student') 
    it "chould change the length of the student array by 1" do
 		expect(@ironhack.add_student(student).to change{@ironhack.students.length}.from(0).to(1)
 	end

 end


 describe "#add_course"
 	course = double('course') 
    it "chould change the length of the student array by 1" do
 		expect(@ironhack.add_course(course).to change{@ironhack.course.length}.from(0).to(1)
 	end

 end

 describe "#add_teacher"
 	teacher = double('teacher') 
    it "chould change the length of the student array by 1" do
 		expect(@ironhack.add_teacher(teacher).to change{@ironhack.teachers.length}.from(0).to(1)
 	end

 end

 describe "#number_of_courses" do

		it "recieves a student and calculatos points based on the number of courses other students do" do
			expect(@ironhack.add_teacher(teacher))
		end
 end

 describe "#number_of_courses" do

		it "recieves a student and calculatos points based on the number of courses other students do" do
			expect(@ironhack.number_of_courses(student1, comparison_students, points))
		end
 end

 describe "#age_comparison" do

		it "recieves a student and calculatos points based on the number of courses other students do" do
			expect(@ironhack.age_comparison(teacher))
		end
 end
