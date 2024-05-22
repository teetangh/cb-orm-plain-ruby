require_relative "app"

# Create a new user
user = User.new(name: 'John Doe', email: 'john@example.com')
user.save

# Update the user's email
user.email = 'john.doe@example.com'
user.save

# Log a custom message
CouchbaseOrm.logger.info "User #{user.id} updated email to #{user.email}"
