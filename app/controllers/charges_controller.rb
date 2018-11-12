require 'stripe'

class ChargesController < ApplicationController
	def index
	end
	
	def new
		@booking_id = params[:booking_id]
		booking = Booking.find(@booking_id)
		passengers_count = booking.passengers.size
		@ammount_to_pay = passengers_count * Flight.find(booking.flight_id).ticket_cost
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
	end
end