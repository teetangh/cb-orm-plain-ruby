require_relative 'app'

Company.all.each(&:destroy)
Employee.all.each(&:destroy)
Customer.all.each(&:destroy)

# Create a company
company = Company.create(name: 'ABC Inc.')

# Create an employee associated with the company
employee = Employee.create(name: 'John Doe', company: company)

# Create a customer associated with the company
customer = Customer.create(name: 'Jane Smith', company: company)

# Retrieve employees and customers associated with the company
company_employees = company.employees
company_customers = company.customers
company = Company.where(name: 'ABC Inc.').first

# Print the results
puts "company #{company.employees.to_json} #{company.strict_loading?}"
# puts "Employees of #{company.to_json}:"
# company_employees.each { |employee| puts "- #{employee.to_json}" }

# puts "\nCustomers of #{company.name}:"
# company_customers.each { |customer| puts "- #{customer.to_json}" }
