require_relative '../lib/school.rb'
require_relative '../lib/student.rb'
require_relative '../lib/teacher.rb'
require_relative '../lib/course.rb'


RSpec.describe Course do
 
 before :each do 
 	@course = Course.new("Mathematics",'10-02-2010', '15-05-2010',Teacher.new("Brian",30))
 end

	 describe "#new" do

	 	it "it creates a course with a name" do
	 		expect(@course.name).to eq("Mathematics")
	 	end

	 	it "it creates a course with a start date" do
	 		expect(@course.start_date.class).to eq(Date)
	 	end

	 	it "it creates a course with a end date" do
	 		expect(@course.end_date.class).to eq(Date)
	 	end

	 	teacher = double('teacher')
	 	allow(teacher).to receive(:name).and_return("Brian")\
	 	allow(teacher).to receive(:age).and_return(30)

	 	it "it creates a course with a start teacher" do

	 		
	 		expect(@course.teacher.name).to eq("Brian")
	 		expect(@course.teacher.age).to eq(30)
	 	end
	end



	

end