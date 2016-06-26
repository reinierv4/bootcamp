require_relative '../lib/school.rb'
require_relative '../lib/student.rb'
require_relative '../lib/teacher.rb'
require_relative '../lib/course.rb'


RSpec.describe Student do
 
 before :each do 
 	@student = School.new("John",10)
 end

	 describe "#new" do

	 	it "it creates a student with a name" do
	 		expect(@student.name).to eq("Reinier")
	 	end

	 	it "it creates a student with a age" do
	 		expect(@student.age).to be(10)
	 	end
	end

end