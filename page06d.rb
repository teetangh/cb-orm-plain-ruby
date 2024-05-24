require_relative 'app'
# Create a planet
planet = Planet.create(name: 'Earth')
# Create species associated with the planet
species1 = Species.new(name: 'Human', planet_id: planet.id)
species2 = Species.new(name: 'Dog', planet_id: planet.id)
# planet.species << species1
# planet.species << species2
# Save the planet (and the associated species)
planet.save
# Querying Associations
planet = Planet.find(planet.id)
species = planet.species
# Eager Loading
# planets = Planet.where(active: true).includes(:species)
# Print the results
puts "Planet: #{planet.name}"
puts 'Species: '
species.each { |s| puts "- #{s.name}" }
# Autosave
planet = Planet.find(planet.id)

planet.name = 'Mars'
planet.species.first.name = 'Martian'
planet.save
# Dependent Associations
planet.destroy
