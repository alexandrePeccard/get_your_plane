class PassengersController < ApplicationController
	def booking_success

		booking = Booking.find(params[:id])
		passengers = booking.passengers
		@flight = Flight.find(booking.flight_id)
		
		passengers.each do |passenger|
			PassengerMailer.booking_success(passenger, @flight).deliver_now!
		end
		
		render 'booking_success'
	end
end