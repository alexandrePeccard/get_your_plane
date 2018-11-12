Rails.application.routes.draw do
	resources :flights, :bookings, :passengers
	post '/search-flights', to: 'flights#get_flights_filters'
	post '/prepare_booking', to: 'flights#prepare_booking'
end