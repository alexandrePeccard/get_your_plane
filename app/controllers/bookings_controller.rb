class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		params[:passengers].to_i.times { @booking.passengers << Passenger.new(firstname: '', lastname: '', email: '') }
		@flight_id = params[:flight_id]
	end

	def create
		booking_params = params.require(:booking).permit(passengers_attributes: [:firstname, :lastname, :email])
		b = Booking.new(flight_id: params[:flight_id])
		for k, v in booking_params.to_h[:passengers_attributes]
			passenger = Passenger.new(firstname: v[:firstname], lastname: v[:lastname], email: v[:email])
			b.passengers << passenger
		end

		b = b.save

		redirect_to controller: 'charges', action: 'new', params: { booking_id: Booking.last.id }
	end
end