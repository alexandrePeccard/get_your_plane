class Passenger < ApplicationRecord
	# has_many :booking
	has_and_belongs_to_many :bookings
end