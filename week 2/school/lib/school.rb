class School
attr_accessor :name, :students, :courses, :enrollments, :teachers

	def initialize(name)
		@name = name
		@students = []
		@courses = []
		@teachers = []
		@enrollments = []
	end

	def add_student(student)
		@students << student
	end

	def add_course(course)
		@courses << course
	end

	def add_teacher(teacher)
		@teachers << teacher
	end

	def add_enrollment(course, student)
		enrollment = Enrollment.new(course, student)
		@enrollments << enrollment
		course.add_enrollment(enrollment)
		student.add_enrollment(enrollment)
	end

	def find_most_similar_student(student)
		#Prepare the right variables for testing
		comparison_students = @students
		comparison_students.delete_at(comparison_students.find_index(student))
		points = []
		#How active are they?
		number_of_courses(student, comparison_students, points)
		#How close are they age wise?
		age_comparison(student, comparison_students, points)
		#How many of the same classes do they follow?
		same_classes_points(student, comparison_students, points)
		#prepare results
		index = points.find_index(points.max)
		message = "The most similar student is #{comparison_students[index].name}, #{comparison_students[index].name} is #{comparison_students[index].age} years old, while #{student.name} is #{student.age}. #{same_classes(comparison_students[index], student)}"
	end

	def number_of_courses(student, comparison_students, points)
	 	comparison_students.each_with_index do |comp_student, index|
	 		points[index] = [(3-(comp_student.getCourseList.length-student.getCourseList.length).abs),0].min
	 	end
	end

	def age_comparison(student, comparison_students, points)
		comparison_students.each_with_index do |comp_student, index| 
			points[index] = 5-(comp_student.age-student.age).abs/5
		end
	end

	def same_classes_points(student, comparison_students, points)
	 	courses = student.getCourseList
	 	comparison_students.each_with_index do |comparison_student, index|
	 		comparison_student.getCourseList.each do |course|
	 			if courses.include? course
	 				points[index] += 1 
	 			end
	 		end
	 	end
	end

	def same_classes(student1, student2)
		same_courses = []
		student1.getCourseList.each do |course|
			if student2.getCourseList.include? course
				same_courses << course
			end
		end

		if same_courses.size == 0
			result = "They did not attend the same classes."
		elsif same_courses.size == 1
			result = "They both attended the #{same_courses[0].name} class."
		else
			result = "They did several courses together like #{same_courses[0].name} and #{same_courses[1].name}."
		end
		result
	end

end



