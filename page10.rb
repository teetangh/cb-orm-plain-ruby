require_relative "app"
require 'securerandom'

Soldier.delete_all

# Create 10 random soldiers
10.times do
  solder_i = Soldier.create(name: SecureRandom.hex(10), status: rand(1..3))
  puts "Soldier created: #{solder_i.to_json}"
end

# Create a new soldier
soldier = Soldier.new(name: 'John Doe')
puts "Soldier status: #{soldier.status}"  # Output: "Soldier status: active"
soldier.save

# Query soldiers by status
active_soldiers = Soldier.where(status: 1)
puts "Active soldiers: #{active_soldiers.map(&:name)}"  # Output: "Active soldiers: ['John Doe']"

# Change the status of a soldier
soldier.status = :inactive
soldier.save
puts "Updated soldier status: #{soldier.status}"  # Output: "Updated soldier status: inactive"

# Try assigning an invalid status
invalid_soldier = Soldier.new(name: 'Invalid Soldier', status: :invalid)
begin
  invalid_soldier.save
  puts "Invalid Soldier status: #{invalid_soldier.status}"
rescue Couchbase::Error::ValidationFailure => e
  puts "Error: #{e.message}"  # Output: "Error: Invalid enum value: :invalid"
end


soldier1 = Soldier.new(name: 'John Doe')
soldier1.status = :active
soldier1.save

soldier2 = Soldier.new(name: 'Jane Smith')
soldier2.status = :inactive
soldier2.save

soldier3 = Soldier.new(name: 'Alice Jones')
soldier3.status = :retired
soldier3.save

# Query soldiers by status
active_soldiers = Soldier.where(status: :active)
puts "Active Soldiers: #{active_soldiers.map(&:name).join(', ')}"  # Output: "Active Soldiers: John Doe"

# Update enum mapping
# puts "Enum Mapping:"
# puts "Active: #{Soldier.status[:active]}"    # Output: "Active: 0"
# puts "Inactive: #{Soldier.status[:inactive]}"  # Output: "Inactive: 1"
# puts "Retired: #{Soldier.status[:retired]}"    # Output: "Retired: 2"

# Enum validation
invalid_soldier = Soldier.new(name: 'Invalid Soldier')
invalid_soldier.status = :invalid
puts "Invalid Soldier: #{invalid_soldier.valid?}"  # Output: "Invalid Soldier: false"
puts "Invalid Soldier Errors: #{invalid_soldier.errors[:status].join(', ')}"  # Output: "Invalid enum value: :invalid"

# Enum defaults
new_soldier = Soldier.new(name: 'New Soldier')
puts "New Soldier Status: #{new_soldier.status}"  # Output: "New Soldier Status: active"
