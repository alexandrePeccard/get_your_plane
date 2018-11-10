Rails.application.routes.draw do
	resources :flights, :users
	post '/search-flights', to: 'flights#get_flights_filters'
end