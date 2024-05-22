# Load the model
require_relative 'app'

# Create a new task
task1 = Task.new(title: 'Task 1', description: 'Description of Task 1')
task1.save
puts "Task 1 created with id: #{task1.id}, #{task1.inspect}"

# Update an existing task
task2 = Task.create(title: 'Task 2', description: 'Description of Task 2')
task2.description = 'Updated description of Task 2'
task2.save
puts "Task 2 updated with id: #{task2.id}, #{task2.inspect}"

# Update specific fields of a task
task3 = Task.create(title: 'Task 3', description: 'Description of Task 3')
task3.update(description: 'Updated description of Task 3', completed: true)
puts "Task 3 updated with id: #{task3.id}, #{task3.inspect}"

# Destroy a task
task4 = Task.create(title: 'Task 4', description: 'Description of Task 4')
task4.destroy
puts "Task 4 destroyed with id: #{task4.id}, #{task4.inspect}"
