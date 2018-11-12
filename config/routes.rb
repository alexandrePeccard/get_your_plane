Rails.application.routes.draw do
	resources :flights, :bookings, :passengers, :charges
	get '/booking_success/:id', to: 'passengers#booking_success'
	post '/search-flights', to: 'flights#get_flights_filters'
	post '/prepare_booking', to: 'flights#prepare_booking'
end