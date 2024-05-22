require_relative "app"

# Create a bank record with an encrypted account number
bank = Bank.new(name: 'My Bank', account_number: '1234567890')
bank.save

# Retrieve the bank record
retrieved_bank = Bank.find(bank.id)
puts "Bank id is: #{bank.id}"
puts "Retrieved bank: #{retrieved_bank.name} - #{retrieved_bank.account_number}"  # Output: "Retrieved bank: My Bank - 1234567890"

encrypted_banks = Bank.where_encrypted(account_number: '1234567890')
puts "Encrypted banks: #{encrypted_banks.map(&:name)}"  # Output: "Encrypted banks: ['My Bank']"
