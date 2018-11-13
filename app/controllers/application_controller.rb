class ApplicationController < ActionController::Base
	include FlightsHelper

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :avatar, :password_confirmation, :avatar_cache, :remove_avatar)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar)}
    end

  private

		def set_request_params
	  	FlightsHelper.request_params = params
		end
end