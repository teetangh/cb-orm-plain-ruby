require_relative "app"

Factory.delete_all

Factory.ensure_design_document!

# Create sample data
Factory.create(name: 'Factory A', location: 'City X', established_year: 2000, active: true)
Factory.create(name: 'Factory B', location: 'City Y', established_year: 2005, active: true)
Factory.create(name: 'Factory C', location: 'City X', established_year: 2010, active: false)
Factory.create(name: 'Factory D', location: 'City Z', established_year: 2015, active: true)

# Query views
puts "Factories by name:"
Factory.by_name(key: 'Factory A').each do |factory|
  puts "- #{factory.name}"
end

puts "\nFactories by location:"
factories = Factory.find_by_location('City X')
factories.each do |factory|
  puts "- #{factory.name} (#{factory.location})"
end

# Find factories by location using by_location
puts "\nFactories by location:"
Factory.by_location(key: 'City X').each do |factory|
  puts "- #{factory.name} (#{factory.location})"
end

puts "\nFactories by established year:"
Factory.by_established_year(key: 2010).each do |factory|
  puts "- #{factory.name}"
end

puts "\nActive factories:"
Factory.by_active(key: true).each do |factory|
  puts "- #{factory.name}"
end

puts "\nFactories by name and location:"
Factory.by_name_and_location(key: ['Factory A', 'City X']).each do |factory|
  puts "- #{factory.name} (#{factory.location})"
end

puts "\nFactories established between 2005 and 2015:"
Factory.by_established_year_range(startkey: 2005, endkey: 2015).each do |factory|
  puts "- #{factory.name} (#{factory.established_year})"
end
