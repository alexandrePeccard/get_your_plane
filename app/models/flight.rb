class Flight < ApplicationRecord
	belongs_to :departure, :class_name => "Airport", :foreign_key => "departure_id"
	belongs_to :destination, :class_name => "Airport", :foreign_key => "destination_id"
end