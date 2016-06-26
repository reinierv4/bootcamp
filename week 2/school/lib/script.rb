require_relative 'school.rb'
require_relative 'student.rb'
require_relative 'teacher.rb'
require_relative 'enrollment.rb'
require_relative 'course.rb'

require 'pry'

#Initiate the school
ironhack = School.new("IronHack")

#initiate the teachers
jake = Teacher.new("Jake", Random.rand(20..30))
ironhack.add_teacher(jake)
lluis = Teacher.new("Lluis", Random.rand(20..30))
ironhack.add_teacher(lluis)
raul = Teacher.new("Raul", Random.rand(20..30))
ironhack.add_teacher(raul)

#initiate the students
satwat = Student.new("Satwat", Random.rand(20..30))
ironhack.add_student(satwat)
marcos = Student.new("Marcos", Random.rand(40..50))
ironhack.add_student(marcos)
ignacio = Student.new("Ignacio", Random.rand(20..30))
ironhack.add_student(ignacio)
daniel = Student.new("Daniel", Random.rand(20..30))
ironhack.add_student(daniel)
fernanda = Student.new("Fernanda", Random.rand(20..30))
ironhack.add_student(fernanda)
tristan = Student.new("Tristan", Random.rand(20..30))
ironhack.add_student(tristan)
magnus = Student.new("Magnus", Random.rand(20..30))
ironhack.add_student(magnus)
reinier = Student.new("Reinier", Random.rand(20..30))
ironhack.add_student(reinier)
alex = Student.new("Alex", Random.rand(20..30))
ironhack.add_student(alex)

#initiate the courses
ruby = Course.new("Ruby",'10-06-2016', '19-06-2016',raul)
ironhack.add_course(ruby)
javascript = Course.new("JavaScript",'20-06-2016', '27-06-2016',raul)
ironhack.add_course(javascript)
html = Course.new("HTML",'28-06-2016', '06-07-2016',lluis)
ironhack.add_course(html)
css = Course.new("CSS",'28-06-2016', '06-06-2016',lluis)

#create enrollments for ruby
ironhack.add_enrollment(ruby, satwat)
ironhack.add_enrollment(ruby, marcos)
ironhack.add_enrollment(ruby, ignacio)
ironhack.add_enrollment(ruby, daniel)
ironhack.add_enrollment(ruby, satwat)

#create enrolments for javascript
ironhack.add_enrollment(javascript, reinier)
ironhack.add_enrollment(javascript, fernanda)
ironhack.add_enrollment(javascript, daniel)
ironhack.add_enrollment(javascript, satwat)
ironhack.add_enrollment(javascript, alex)
ironhack.add_enrollment(javascript, magnus)

#create enrolments for css
ironhack.add_enrollment(css, reinier)
ironhack.add_enrollment(css, ignacio)
ironhack.add_enrollment(css, tristan)
ironhack.add_enrollment(css, satwat)
ironhack.add_enrollment(css, alex)
ironhack.add_enrollment(css, ignacio)

#create enrolments for css
ironhack.add_enrollment(html, fernanda)
ironhack.add_enrollment(html, marcos)
ironhack.add_enrollment(html, daniel)


#Show most similar student for
puts ironhack.find_most_similar_student(satwat)
puts ironhack.find_most_similar_student(daniel)
puts ironhack.find_most_similar_student(alex)














