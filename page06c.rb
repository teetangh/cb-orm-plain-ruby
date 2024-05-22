require_relative 'app'

# Create a company
company = Company.create(name: 'ABC Inc.')

# Create an employee associated with the company
employee = Employee.create(name: 'John Doe', employable: company)

# Create a customer associated with the company
customer = Customer.create(name: 'Jane Smith', customizable: company)

# Retrieve employees and customers associated with the company
company_employees = company.employees
company_customers = company.customers

# Print the results
puts "Employees of #{company.name}:"
company_employees.each { |employee| puts "- #{employee.name}" }

puts "\nCustomers of #{company.name}:"
company_customers.each { |customer| puts "- #{customer.name}" }
