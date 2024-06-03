
require_relative 'app'
require 'securerandom'

# Output the count of records before deletion
puts "Records count before deletion: #{N1QLTest.count}"

# Delete all records
# N1QLTest.all.each(&:destroy)
N1QLTest.delete_all

N1QLTest.ensure_design_document!

# Output the count of records after deletion
puts "Records count after deletion: #{N1QLTest.count}"

def create_small_data
  N1QLTest.create!(name: 'John', lastname: 'Doe', rating: :awesome, country: 'USA')
  N1QLTest.create!(name: 'Jane', lastname: 'Smith', rating: :good, country: 'Canada')
  N1QLTest.create!(name: 'Bob', lastname: 'Johnson', rating: :okay, country: 'USA')
  N1QLTest.create!(name: 'Alice', lastname: 'Williams', rating: :bad, country: 'Australia')
  N1QLTest.create!(name: 'Mark', lastname: 'Davis', rating: :awesome, country: 'USA')
  N1QLTest.create!(name: 'Sue', lastname: 'Brown', rating: :good, country: 'Canada')
  N1QLTest.create!(name: 'Tom', lastname: 'Miller', rating: :okay, country: 'USA')
end

def create_big_data
  50_000.times do |i|
    N1QLTest.create(
      name: SecureRandom.hex(10),
      lastname: SecureRandom.hex(10),
      rating: rand(1..5),
      country: ['USA', 'Canada', 'Australia'].sample
    )
    puts "Record created: #{i}" if (i % 10_000).zero?
  end
end

def count_docs(docs)
  docs ? docs.count : 'Not created'
end

# Flag to track which data set is being queried
data_set = nil

loop do
  puts "Do you want to create data with small records or big records? Enter 'small' or 'big' (or 'exit' to quit):"
  choice = gets.chomp.downcase

  case choice
  when 'small'
    create_small_data
    data_set = :small
    break
  when 'big'
    create_big_data
    data_set = :big
    break
  when 'exit'
    break
  else
    puts "Invalid choice. Please enter 'small' or 'big'."
  end
end

# Query by custom rating
docs = N1QLTest.by_custom_rating.collect { |ob| ob.name }
puts "By custom rating #{docs.count}"

# Query by name
docs = N1QLTest.by_name(key: 'John').collect { |ob| ob.name }
puts "By name #{docs.count}"

# Query by lastname
docs = N1QLTest.by_lastname(key: 'Doe').collect { |ob| ob.name }
puts "By lastname #{docs.count}"

# docs = N1QLTest.by_name_and_rating(name: 'John', rating: 'awesome')
# puts "By name and rating #{count_docs(docs)}"

# Query by country
docs = N1QLTest.by_country(key: 'USA').collect { |ob| ob.name }
puts "By country #{docs.count}"

# Query by rating emit
docs = N1QLTest.by_rating_emit(key: 1).collect { |ob| ob.name }
puts "By rating emit #{docs.count}"

# Query by custom rating values
docs = N1QLTest.by_custom_rating_values(key: [[1, 2]]).collect { |ob| ob.name }
puts "By custom rating values #{docs.count}"

# Query by rating reverse
docs = N1QLTest.by_rating_reverse(key: 1).collect { |ob| ob.name }
puts "By rating reverse #{docs.count}"

# Query by rating without docs
docs = N1QLTest.by_rating_without_docs(key: 1)
puts "By rating without docs #{docs.count}"

# Query using index_n1ql
docs = N1QLTest.find_by_rating(2).collect { |ob| ob.name }
puts "By index_n1ql #{docs.count}"

# Query using index_n1ql
docs = N1QLTest.by_rating.to_a.collect { |ob| ob.name }
puts "By index_n1ql #{docs.count}"
