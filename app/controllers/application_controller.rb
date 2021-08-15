class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:new_profile_picture, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_profile_picture, :introduction, :username, :remove_profile_picture])
  end


end
