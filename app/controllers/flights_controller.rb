class FlightsController < ApplicationController
	def index
		@codes = Airport.order(:airport_code).all.pluck(:airport_code)
		@cities = Airport.order(:city).all.pluck(:city)
		if params[:flights]
			@flights = Flight.where(id: params[:flights])
		else
			@flights = Flight.all
		end
	end

	def get_flights_filters
		flights_search_params = {}
		if params[:filters][:airport][:departure_code] && params[:filters][:airport][:departure_code] != ""
			@departures_airports = Airport.where("lower(airport_code) = ?", params[:filters][:airport][:departure_code].lstrip.rstrip.downcase).pluck(:id)
			flights_search_params[:departure_id] = @departures_airports
		end

		if params[:filters][:airport][:destination_code] && params[:filters][:airport][:destination_code] != ""
			@departures_airports = Airport.where("lower(airport_code) = ?", params[:filters][:airport][:destination_code].lstrip.rstrip.downcase).pluck(:id)
			flights_search_params[:destination_id] = @departures_airports
		end

		if params[:filters][:airport][:departure_city] && params[:filters][:airport][:departure_city] != ""
			@departures_airports = Airport.where("lower(city) = ?", params[:filters][:airport][:departure_city].lstrip.rstrip.downcase).pluck(:id)
			flights_search_params[:departure_id] = @departures_airports
		end

		if params[:filters][:airport][:destination_city] && params[:filters][:airport][:destination_city] != ""
			@destination_airports = Airport.where("lower(city) = ?", params[:filters][:airport][:destination_city].lstrip.rstrip.downcase).pluck(:id)
			flights_search_params[:destination_id] = @destination_airports
		end

		if params[:filters][:flights][:departure_date] && params[:filters][:flights][:departure_date] != ""
			flights_search_params[:departure_date] = Date.parse(params[:filters][:flights][:departure_date])
		end

		if params[:filters][:flights][:arrival_date] && params[:filters][:flights][:arrival_date] != ""
			flights_search_params[:arrival_date] = Date.parse(params[:filters][:flights][:arrival_date])
		end
		
		@flights = Flight.where(flights_search_params).pluck(:id)
		params = {}

		if @flights.any?
			flash[:success] = "Un ou plusieurs vols correspondent à vos critères de recherche."
			params = { flights: @flights }
		else
			flash[:warning] = "Aucun vol dispopnible correspondant à vos critères !"
		end
		redirect_to controller: 'flights', action: 'index', params: params
	end
end