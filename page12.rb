require_relative "app"

# Remember to set the COUCHBASE_ORM_DEBUG environment variable to the desired logger level
# export COUCHBASE_ORM_DEBUG=Logger::DEBUG

# Create a new user
user = User.new(name: 'John Doe', email: 'john@example.com')
user.save

# Update the user's email
user.email = 'john.doe@example.com'
user.save

# Log a custom message at different logger levels
CouchbaseOrm.logger.debug "User #{user.id} updated email to #{user.email}"
CouchbaseOrm.logger.info "User #{user.id} updated email to #{user.email}"
CouchbaseOrm.logger.warn "User #{user.id} updated email to #{user.email}"
CouchbaseOrm.logger.error "User #{user.id} updated email to #{user.email}"
CouchbaseOrm.logger.fatal "User #{user.id} updated email to #{user.email}"
