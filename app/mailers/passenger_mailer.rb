class PassengerMailer < ApplicationMailer
	default from: ENV["MAIL_ADDRESS"]
 
  def booking_success(passenger, flight)
    @flight = flight
	    mail(
      	to: passenger.email,
      	subject: 'You successfully booked a flight.'
        ).deliver!
  end
end