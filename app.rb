require 'bundler/setup'
require 'couchbase'
require_relative 'config/initializers/couchbase'

require_relative 'models/post'
require_relative 'models/user'
require_relative 'models/document'
require_relative 'models/book'
require_relative 'models/author'
require_relative 'models/comment'
require_relative 'models/task'
require_relative 'models/pubmag'
require_relative 'models/EmpCusCompany'
require_relative 'models/PlanetSpecies'
require_relative 'models/Airport'
require_relative 'models/Soldier'
require_relative 'models/Bank'
require_relative 'models/Writer'
require_relative 'models/TeacherStudent'
require_relative 'models/N1QLTest'
require_relative 'models/CarParts'
require_relative 'models/Space'

# # Creating a new post
# post = Post.create(title: 'My First Post', content: 'Hello, world!')
# puts "Created post: #{post.id} - #{post.title} - #{post.content}"

# # Finding a post by ID
# found_post = Post.find(post.id)
# puts "Found post: #{found_post.id} - #{found_post.title} - #{found_post.content}"

# # Updating a post
# found_post.update(content: 'Hello, Couchbase!')
# puts "Updated post: #{found_post.id} - #{found_post.title} - #{found_post.content}"

# # Deleting a post
# found_post.destroy
# puts "Deleted post with ID: #{found_post.id}"

# Create a user with post
# user = User.create(name: 'John Doe', email: 'john@temp.com', posts: [Post.new(title: 'My First Post', content: 'Hello, world!')])
# puts "Created user: #{user.id} - #{user.name} - #{user.email} - #{user.posts.first.title} - #{user.posts.first.content}"

# user = User.create(name: 'John Doe', email: 'john@temp.com', posts: [])
# puts "Created user: #{user.id} - #{user.name} - #{user.email}"

# # user.posts << Post.new(title: 'My First Post', content: 'Hello, world!')
# user = User.find(user.id)
# user.posts << Post.new(title: 'My First Post', content: 'Hello, world!')
# puts "Created post: #{user.posts.title} - #{user.posts.content}"
