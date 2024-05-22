require_relative 'app'
# Create a planet
planet = Planet.create(name: 'Earth')

# Create species associated with the planet
species1 = Species.new(name: 'Human')
species2 = Species.new(name: 'Dog')
planet.species << species1
planet.species << species2

# Save the planet (and the associated species)
planet.save

# Querying Associations
planet = Planet.find('planet_id_123')
species = planet.species

# Eager Loading
planets = Planet.where(active: true).includes(:species)

# Print the results
puts "Planet: #{planet.name}"
puts "Species: "
species.each { |s| puts "- #{s.name}" }

# Autosave
planet = Planet.find('planet_id_123')
planet.name = 'Mars'
planet.species.first.name = 'Martian'
planet.save

# Dependent Associations
planet.destroy
