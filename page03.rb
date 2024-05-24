require_relative 'app'

puts "Hello"
# # Creating a new post
user = User.new
user.name = 'John Doe'
user.age = 25
user.height = 180
user.is_active = true
user.birth_date = Date.new(1995, 1, 1)
user.created_at = Time.now
user.appointment_time = Time.new(2022, 12, 31, 10, 30)
user.hobbies = ['Reading', 'Swimming', 'Cycling']
user.metadata = { 'key1' => 'value1', 'key2' => 'value2' }
user.avatar = false
user.save

puts "User: #{user.id}"
puts "name: #{user.name} (#{user.name.class})"
puts "age: #{user.age} (#{user.age.class})"
puts "height: #{user.height} (#{user.height.class})"
puts "is_active: #{user.is_active} (#{user.is_active.class})"
puts "birth_date: #{user.birth_date} (#{user.birth_date.class})"
puts "created_at: #{user.created_at} (#{user.created_at.class})"
puts "appointment_time: #{user.appointment_time} (#{user.appointment_time.class})"
puts "hobbies: #{user.hobbies} (#{user.hobbies.class})"
puts "metadata: #{user.metadata} (#{user.metadata.class})"
puts "avatar: #{user.avatar} (#{user.avatar.class})"

puts "created_at: #{user.created_at} (#{user.created_at.class})"
puts "updated_at: #{user.updated_at} (#{user.updated_at.class})"

# Create a new post
post = Post.new

# Test default value for title
puts "Title: #{post.title} (#{post.title.class})" # Should output 'Untitled' (String)

# Test alias for content
post.body = 'Lorem ipsum dolor sit amet.'
puts "Content: #{post.content} (#{post.content.class})" # Should output 'Lorem ipsum dolor sit amet.' (String)

# Test readonly attribute
post.published_at = Time.now
puts "Published At: #{post.published_at} (#{post.published_at.class})" # Should output 'nil' (NilClass) because published_at is readonly

# Attempt to modify readonly attribute
post.published_at = Time.now + 1000
puts "Published At: #{post.published_at} (#{post.published_at.class})" # Should output 'nil' (NilClass) because published_at is readonly

post.save
puts "Post: #{post.id}"
