require_relative 'app'

# Create a new airport with geo coordinates
airport = Airport.new(
  airportname: 'John F. Kennedy International Airport',
  city: 'New York',
  country: 'USA',
  faa: 'JFK',
  icao: 'KJFK',
  tz: 'America/New_York',
  geo: AirportGeoCoordinates.new(lat: 40.6413, lon: -73.7781, alt: 13)
)
airport.save

puts "Created Airport:"
puts "Airport ID: #{airport.id}"
puts "Name: #{airport.airportname}"
puts "City: #{airport.city}"
puts "Country: #{airport.country}"
puts "FAA: #{airport.faa}"
puts "ICAO: #{airport.icao}"
puts "Timezone: #{airport.tz}"
puts "Geo Coordinates: #{airport.geo.lat}, #{airport.geo.lon}, #{airport.geo.alt}"
puts ""

airport = Airport.find(airport.id)
airport.geo.lat = 41.0
airport.geo.lon = -74.0
airport.geo.alt = 15
airport.save

puts "Updated Airport:"
puts "Airport ID: #{airport.id}"
puts "Geo Coordinates Updated: #{airport.geo.lat}, #{airport.geo.lon}, #{airport.geo.alt}"
puts ""

# Query airports with specific geo coordinates
query_airports = Airport.where('geo.lat > 40.0 AND geo.lat < 42.0')
puts "Query Results:"
query_airports.each do |query_airport|
  puts "Airport ID: #{query_airport.id}, Name: #{query_airport.airportname}"
end
puts ""

# Validate the airport and nested geo coordinates
invalid_airport = Airport.new(
  airportname: 'Invalid Airport',
  city: 'Invalid City',
  country: 'Invalid Country',
  faa: 'INV',
  icao: 'KINV',
  tz: 'Invalid/TZ',
  geo: AirportGeoCoordinates.new(lat: 100.0, lon: 200.0, alt: 1001)
)
puts "Validation Results for Invalid Airport:"
puts "Valid? #{invalid_airport.valid?}"
puts "Errors: #{invalid_airport.errors[:geo].join(', ')}"
