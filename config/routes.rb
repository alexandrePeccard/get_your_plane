Rails.application.routes.draw do
	root to: 'pages#home'
	devise_for :users
	# , :controllers => {:registrations => "custom_registration"}
	get '/profile', to: 'pages#profile'
	resources :flights, :bookings, :passengers, :charges
	get '/test', to: 'pages#test'
	get '/booking_success/:id', to: 'passengers#booking_success'
	get '/flights-results', to: 'flights#flights_results'
	post '/search-flights', to: 'flights#get_flights_filters'
	post '/prepare_booking', to: 'flights#prepare_booking'
end