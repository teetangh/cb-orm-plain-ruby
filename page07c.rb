require_relative 'app'
require 'securerandom'

# Create 50k random records
50_000.times do |_i|
  N1QLTest.create(
    name: SecureRandom.hex(10),
    lastname: SecureRandom.hex(10),
    rating: rand(1..5),
  )
  puts "Record created: #{_i}" if (_i % 10_000).zero?
end

# Output the count of records before deletion
puts "Records count before deletion: #{N1QLTest.count}"

# Delete all records
N1QLTest.all.each(&:destroy)

# Output the count of records after deletion
puts "Records count after deletion: #{N1QLTest.count}"
