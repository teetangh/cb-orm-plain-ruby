require_relative "app"
require 'base64'
require 'logger'

Bank.all.each(&:destroy)

# Method to print serialized attributes
def expect_serialized_attributes(bank)
  serialized_attrs = bank.send(:serialized_attributes)
  puts "Serialized Attributes:"
  serialized_attrs.each do |key, value|
    puts "#{key}: #{value}"
  end

  json_attrs = JSON.parse(bank.to_json)
  puts "\nAttributes from JSON:"
  json_attrs.each do |key, value|
    puts "#{key}: #{value}"
  end
  puts "\nAttributes from as_json:"
  bank.as_json.each do |key, value|
    puts "#{key}: #{value}"
  end
end

# Create a new bank record with encrypted attributes
bank = Bank.new(
  name: "Test Bank",
  account_number: Base64.strict_encode64("123456789"),
  routing_number: Base64.strict_encode64("987654321")
)

# Print serialized attributes before saving
puts "Before Save:"
expect_serialized_attributes(bank)

# Save the bank record to Couchbase
bank.save!

# Reload the bank record from Couchbase
bank.reload

# Print serialized attributes after reloading
puts "\nAfter Reload:"
expect_serialized_attributes(bank)

# Find the bank record by ID
found_bank = Bank.find(bank.id)

# Print serialized attributes after finding
puts "\nAfter Find:"
expect_serialized_attributes(found_bank)
