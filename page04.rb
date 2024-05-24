# Load the model
require_relative 'app'

Author.all.each(&:destroy)

# Create new authors
author1 = Author.new(name: 'John Doe', age: 30, active: true)
author2 = Author.new(name: 'Jane Smith', age: 25, active: false)
author3 = Author.new(name: 'Alice Brown', age: 40, active: true)
author4 = Author.new(name: 'Bob Johnson', age: 17, active: true)

# Save authors
author1.save
author2.save
author3.save
author4.save

# Find authors by ID
puts "Find by ID:"
puts Author.find(author1.id).inspect

# Find the first author with a specific name
puts "\nFind by name:"
puts Author.find_by(name: 'John Doe').inspect

# Where
puts "\nWhere chain:"
puts Author.where(active: true).where('age >= 30').to_a.inspect

puts "\nWhere with regex:"
puts Author.where("name like '%John%'").to_a.inspect


# # Find all active authors
# puts "\nFind all active authors:"
# puts Author.isactive.to_a.inspect

# # Find all adult authors
# puts "\nFind all adult authors:"
# puts Author.adults.to_a.inspect

# Order authors by name
puts "\nOrder by name:"
puts Author.order(:name).to_a.inspect

# Order authors by age in descending order
puts "\nOrder by age (descending):"
puts Author.order(age: :desc).to_a.inspect

# Pluck names of all authors
puts "\nPluck names:"
puts Author.order(:name).pluck(:name).inspect

# Destroy all inactive authors
puts "\nDestroy all inactive authors:"
authors = Author.where(active: false).to_a
puts authors.inspect
Author.where(active: false).each(&:destroy)

# Check remaining authors
puts "\nRemaining authors:"
puts Author.all.to_a.inspect
