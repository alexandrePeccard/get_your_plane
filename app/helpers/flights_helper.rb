module FlightsHelper
	cattr_accessor :request_params

	def compute_filters_parameters
		flights_search_request_params = {}
		@departures_airports = []
		@destination_airports = []

		if request_params[:filters][:airport][:departure_code] && request_params[:filters][:airport][:departure_code] != ""
			@departures_airports << Airport.where("lower(airport_code) = ?", request_params[:filters][:airport][:departure_code].lstrip.rstrip.downcase).pluck(:id)
		end

		if request_params[:filters][:airport][:departure_city] && request_params[:filters][:airport][:departure_city] != ""
			@departures_airports << Airport.where("lower(city) = ?", request_params[:filters][:airport][:departure_city].lstrip.rstrip.downcase).pluck(:id)
		end

		if request_params[:filters][:airport][:destination_code] && request_params[:filters][:airport][:destination_code] != ""
			@destination_airports << Airport.where("lower(airport_code) = ?", request_params[:filters][:airport][:destination_code].lstrip.rstrip.downcase).pluck(:id)
		end

		if request_params[:filters][:airport][:destination_city] && request_params[:filters][:airport][:destination_city] != ""
			@destination_airports << Airport.where("lower(city) = ?", request_params[:filters][:airport][:destination_city].lstrip.rstrip.downcase).pluck(:id)
		end

		if request_params[:filters][:flights][:departure_date] && request_params[:filters][:flights][:departure_date] != ""
			flights_search_request_params[:departure_date] = Date.parse(request_params[:filters][:flights][:departure_date])
		end

		if request_params[:filters][:flights][:arrival_date] && request_params[:filters][:flights][:arrival_date] != ""
			flights_search_request_params[:arrival_date] = Date.parse(request_params[:filters][:flights][:arrival_date])
		end
		
		@departures_airports = @departures_airports.flatten
		@destination_airports = @destination_airports.flatten

		flights_search_request_params[:destination_id] = @destination_airports
		flights_search_request_params[:departure_id] = @departures_airports

		flights_search_request_params
	end
end