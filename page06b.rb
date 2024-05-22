require_relative "app"

Student.all.each(&:destroy)
Teacher.all.each(&:destroy)

# Creating a new teacher
puts "\nCreating a new teacher..."
teacher1 = Teacher.create(name: 'Mr. Smith', subject: 'Mathematics')
puts teacher1.inspect

# Creating new students
puts "\nCreating new students..."
student1 = Student.create(name: 'John Doe', grade: 9, teacher_id: teacher1.id)
student2 = Student.create(name: 'Jane Roe', grade: 10, teacher_id: teacher1.id)
puts student1.inspect
puts student2.inspect

# Associating students with teacher
puts "\nAssociating students with teacher..."
# teacher1.students << student1 # Only updates in the local environment
# teacher1.students << student2
puts "Teacher's students: #{teacher1.students.inspect}"

# Find a teacher by a student's teacher_id
puts "\nFinding a teacher by a student's teacher_id..."
found_teacher = Teacher.find(student1.teacher_id)
puts found_teacher.inspect

# List students of a teacher
puts "\nListing students of a teacher..."
teacher1.reload
teacher_students = teacher1.students
teacher_students.each { |student| puts student.inspect }

# Update a student's grade
puts "\nUpdating a student's grade..."
student1.update(grade: 10)
puts student1.inspect

# Destroy a student
# puts "\nDestroying a student..."
# student2.destroy
# puts student2.inspect

# Validating the presence of attributes
puts "\nValidating the presence of attributes..."
student_without_name = Student.new(grade: 12, teacher_id: teacher1.id)
puts "Student without name is valid: #{student_without_name.valid?}"
puts student_without_name.errors.inspect
