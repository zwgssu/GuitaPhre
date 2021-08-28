class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:new_profile_picture, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_profile_picture, :introduction, :username, :remove_profile_picture])
  end

  class Forbidden < StandardError; end

  if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
    rescue_from StandardError, with: :rescue_internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
  end

  rescue_from Forbidden, with: :rescue_forbidden

  private def rescue_bad_request(exception)
    render "errors/bad_request", status: 400, layout: "error", formats: [:html]
  end
  private def rescue_forbidden(exception)
    render "errors/forbidden", status: 403, layout: "error", formats: [:html]
  end
  private def rescue_not_found(exception)
    render "errors/not_found", status: 404, layout: "error", formats: [:html]
  end
  private def rescue_internal_server_error(exception)
    render "errors/internal_server_error", status: 500, layout: "error", formats: [:html]
  end

end
