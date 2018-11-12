class Booking < ApplicationRecord
	belongs_to :flight
	# belongs_to :passenger
	has_and_belongs_to_many :passengers

	accepts_nested_attributes_for :passengers
end