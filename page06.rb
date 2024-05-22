
require_relative 'app'

Publisher.all.each(&:destroy)
Magazine.all.each(&:destroy)
PublishersMagazines.all.each(&:destroy)

# Create publishers
publisher1 = Publisher.create(name: 'Penguin Random House')
publisher2 = Publisher.create(name: 'Hearst Communications')

# Create magazines
magazine1 = Magazine.create(title: 'Vogue', genre: 'Fashion')
magazine2 = Magazine.create(title: 'National Geographic', genre: 'Science')

# Associate publishers with magazines
publisher1.magazines << magazine1
publisher2.magazines << magazine2

# Print publishers and their magazines
puts "Publishers:"
puts Publisher.all.map { |publisher| "#{publisher.name} (ID: #{publisher.id})" }

puts "\nMagazines:"
puts Magazine.all.map { |magazine| "#{magazine.title} (Genre: #{magazine.genre}) by #{magazine.publishers.map(&:name).join(', ')} (ID: #{magazine.id})" }

# print magazine and tojson
puts "\nMagazines:"
puts Magazine.all.map { |magazine| "#{magazine.to_json}" }
