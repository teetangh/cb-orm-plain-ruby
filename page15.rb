require_relative 'app'
# Create some users
User.create(name: 'John Doe', email: 'john@example.com', age: 30)
User.create(name: 'Jane Doe', email: 'jane@example.com', age: 25)
User.create(name: 'Alice Smith', email: 'alice@example.com', age: 35)

# Test querying methods
puts "Find by ID:"
user = User.find(1)
puts "User: #{user.name}, #{user.email}, #{user.age}"

puts "\nFind by conditions:"
user = User.find_by(email: 'jane@example.com')
puts "User: #{user.name}, #{user.email}, #{user.age}"

puts "\nWhere conditions:"
users = User.where(age: 30)
puts "Users with age 30:"
users.each { |u| puts "#{u.name}, #{u.email}, #{u.age}" }

puts "\nOrder by attribute:"
users = User.order(:age, :desc)
puts "Users ordered by age (desc):"
users.each { |u| puts "#{u.name}, #{u.email}, #{u.age}" }

puts "\nLimit and offset:"
users = User.limit(2).offset(1)
puts "Limited and offset users:"
users.each { |u| puts "#{u.name}, #{u.email}, #{u.age}" }

puts "\nPluck attributes:"
emails = User.pluck(:email)
puts "Emails:"
emails.each { |email| puts email }

puts "\nAll users:"
all_users = User.all
all_users.each { |u| puts "#{u.name}, #{u.email}, #{u.age}" }
