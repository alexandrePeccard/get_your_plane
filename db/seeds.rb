# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

durations = [60, 500, 800, 40, 225, 740, 400, 285, 612, 178, 80]

# creation of airports
10.times do
	city = Faker::Address.city
	code = ""

	# compute the airport_code with the initials of the city
	city.upcase.split(' ').each do |word|
		code += word[0, 1]
	end

	Airport.new(country: Faker::Address.country.unicode_normalize, city: city.unicode_normalize, airport_code: code.unicode_normalize).save
end


# creation of flights
200.times do
	#compute the maximum of seats on this flight
	max_seats = rand(50..500)

	#compute the duration of the flight
	duration = durations[rand(0..10)]

	#compute departure date
	departure = Randomize.new.generate_random_date

	# add duration of the flight to compute the arrival date
	arrival = departure + duration * 60

	Flight.new(
		max_seats: max_seats, 
		available_seats: max_seats,
		duration: duration,

		departure: Airport.find(rand(1..10)),
		destination: Airport.find(rand(1..10)),

		departure_date: Date.parse(departure.to_s),
		departure_hour: departure.strftime('%H'),
		departure_minutes: departure.strftime('%M'),

		arrival_hour: arrival.strftime('%H'),
		arrival_minutes: arrival.strftime('%M'),
		arrival_date: Date.parse(arrival.to_s),
	).save
end