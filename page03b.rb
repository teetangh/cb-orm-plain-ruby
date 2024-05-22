require_relative 'app'

# Create a new document
document = Document.new(title: 'Sample Document', content: 'Lorem ipsum dolor sit amet.')

# Save the document (will trigger before_create and after_create callbacks)
document.save

# Update the document (will trigger before_update and after_update callbacks)
document.content = 'Updated content'
document.save

# Destroy the document (will trigger before_destroy and after_destroy callbacks)
document.destroy
