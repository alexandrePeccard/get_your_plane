class FlightsController < ApplicationController
	include FlightsHelper
	before_action :set_request_params

	def index
		@codes = Airport.order(:airport_code).all.pluck(:airport_code)
		@cities = Airport.order(:city).all.pluck(:city)
	end

	def prepare_booking

		permitted = params.require(:book).permit(:flight_id, :passengers)
		permitted
		permitted.permitted?
		
		redirect_to controller: 'bookings', action: 'new', params: permitted 
	end

	def get_flights_filters
		flights_search_parameters = compute_filters_parameters
		@flights = []

		if params[:filters][:criteria] == true.to_s
			# si on veut n'afficher que les vols qui correspondent à tous les critères
			@flights = Flight.where(flights_search_parameters).pluck(:id)
		else
			# si on souhaite afficher tous les vols qui correspondent à au moins un critère
			for k, v in flights_search_parameters
				@flights << Flight.where({ k => v}).pluck(:id)
			end
		end
		@flights = @flights.flatten

		redirect_params = {}

		if @flights.any?
			flash[:success] = "Un ou plusieurs vols correspondent à vos critères de recherche."
			redirect_params = { flights: @flights }
		else
			flash[:warning] = "Aucun vol dispopnible correspondant à vos critères !"
		end

		redirect_to controller: 'flights', action: 'flights_results', params: redirect_params
	end

	def flights_results
		@flights = Flight.where(id: params[:flights])

		render 'flights_results'
	end
end