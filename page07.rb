require_relative 'app'

# Create a new writer
puts "\nCreating a new writer..."
writer1 = Writer.create(name: 'Alice', age: 30, country: 'USA', email: 'alice@example.com', active: true)
puts writer1.inspect

# Find a writer by name
puts "\nFinding a writer by name..."
found_writer = Writer.by_name('Alice')
puts found_writer.inspect

# Find a writer by country
puts "\nFinding writers by country..."
writers_in_usa = Writer.by_country('USA')
writers_in_usa.each { |writer| puts writer.inspect }

# Find a writer by email
puts "\nFinding a writer by email..."
writer_by_email = Writer.find_by_email('alice@example.com')
puts writer_by_email.inspect

# Update a writer
puts "\nUpdating a writer..."
writer1.update(age: 31)
puts writer1.inspect

# Destroy a writer
puts "\nDestroying a writer..."
writer1.destroy
puts writer1.inspect

# Validate the presence of attributes
puts "\nValidating the presence of attributes..."
writer_without_name = Writer.new(age: 25, country: 'Canada')
puts "Writer without name is valid: #{writer_without_name.valid?}"
puts writer_without_name.errors.inspect
