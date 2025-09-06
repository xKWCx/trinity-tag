class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Add as many additional keys and attributes as you need
  # NOTE:  This is for nested attributes layouts
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, address_attributes: [ :country, :state, :city, :area, :postal_code ] ])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :phone ])
  end
end
