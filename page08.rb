require_relative 'app'

Space.delete_all
Spaceship.delete_all
Astronaut.delete_all

Space.ensure_design_document!
Spaceship.ensure_design_document!
Astronaut.ensure_design_document!

# Create sample data
space1 = Space.create(name: 'International Space Station', description: 'A space station in low Earth orbit')
space2 = Space.create(name: 'Apollo 11', description: 'The first manned mission to land on the Moon')

spaceship1 = Spaceship.create(name: 'Crew Dragon', model: 'Dragon 2', space_id: space1.id)
spaceship2 = Spaceship.create(name: 'Lunar Module', model: 'Apollo LM', space_id: space2.id)

Astronaut.create(name: 'Neil Armstrong', age: 38, specialty: 'Commander', spaceship_id: spaceship2.id)
Astronaut.create(name: 'Buzz Aldrin', age: 39, specialty: 'Lunar Module Pilot', spaceship_id: spaceship2.id)
Astronaut.create(name: 'Michael Collins', age: 38, specialty: 'Command Module Pilot', spaceship_id: spaceship2.id)
Astronaut.create(name: 'Robert Behnken', age: 49, specialty: 'Commander', spaceship_id: spaceship1.id)
Astronaut.create(name: 'Douglas Hurley', age: 53, specialty: 'Spacecraft Commander', spaceship_id: spaceship1.id)

# Query views
puts "Spaces by name:"
Space.by_name(key: 'International Space Station').each do |space|
  puts "- #{space.name}"
end

puts "\nSpaces by creation date:"
# Space.by_created_at(startkey: Time.now - 30.days, endkey: Time.now).each do |space|
Space.by_created_at.each do |space|
  puts "- #{space.name} (#{space.created_at})"
end

puts "\nSpaceships by space ID:"
Spaceship.by_space_id(key: space1.id).each do |spaceship|
  puts "- #{spaceship.name}"
end

puts "\nSpaceships by model:"
Spaceship.by_model(key: 'Dragon 2').each do |spaceship|
  puts "- #{spaceship.name}"
end

puts "\nSpaceships by space ID and creation date:"
# Spaceship.by_space_id_and_created_at(startkey: [space2.id, Time.now - 50.years], endkey: [space2.id, Time.now]).each do |spaceship|
Spaceship.by_space_id_and_created_at.each do |spaceship|
  puts "- #{spaceship.name} (#{spaceship.created_at})"
end

puts "\nAstronauts by spaceship ID:"
Astronaut.by_spaceship_id(key: spaceship2.id).each do |astronaut|
  puts "- #{astronaut.name}"
end

puts "\nAstronauts by specialty:"
Astronaut.by_specialty(key: 'Commander').each do |astronaut|
  puts "- #{astronaut.name}"
end

puts "\nAstronauts by age range:"
# Astronaut.by_age(startkey: 35, endkey: 45).each do |astronaut|
Astronaut.by_age.each do |astronaut|
  puts "- #{astronaut.name} (#{astronaut.age})"
end
