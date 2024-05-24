require_relative "app"

# Create a product with associated images
product = Product.create(name: 'Product 1', price: 9.99)
product.images.create(url: 'image1.jpg')
product.images.create(url: 'image2.jpg')
product.save

puts "Product created with #{product.images.count} images."

# Create a category with associated images
category = Category.create(name: 'Category 1')
category.images.create(url: 'category_image1.jpg')
category.images.create(url: 'category_image2.jpg')
category.save

puts "Category created with #{category.images.count} images."

# Test autosave
product.images.first.url = 'updated_image1.jpg'
product.save

puts "Product image updated: #{product.images.first.url}"

# Test dependent destroy
product.destroy

puts "Product destroyed. Associated images count: #{Image.where(imageable_id: product.id, imageable_type: 'Product').count}"

# Retrieve polymorphic associations
image = Image.first
imageable = image.imageable

puts "Image #{image.id} belongs to #{imageable.class} with ID #{imageable.id}"
