# Load the model
require_relative 'app'

Comment.all.each(&:destroy)

# Create some comments
comment1 = Comment.new(title: 'First Comment', author: 'Anne McCaffrey', category: 'S-F', ratings: 5)
comment2 = Comment.new(title: 'Second Comment', author: 'Anne McCaffrey', category: 'S-F', ratings: 4)
comment3 = Comment.new(title: 'Third Comment', author: 'Anne McCaffrey', category: 'S-F', ratings: 3)
comment4 = Comment.new(title: 'Fourth Comment', author: 'Anne McCaffrey', category: 'S-F', ratings: 2)

# Save the comments
comment1.save
comment2.save
comment3.save
comment4.save

# Example usage of scopes
comments = Comment.by_author("Anne McCaffrey").in_category('S-F').highly_rated.order(:title).limit(10)

# Iterate over the comments
comments.each do |comment|
  puts "Title: #{comment.title}, Author: #{comment.author}, Category: #{comment.category}, Ratings: #{comment.ratings}"
end
