class ApplicationController < ActionController::Base
	include FlightsHelper

	def set_request_params
  	FlightsHelper.request_params = params
	end
end