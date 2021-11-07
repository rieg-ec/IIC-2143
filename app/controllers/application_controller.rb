# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    return stored_location if redirect_to_stored_location?

    root_path
  end

  def pundit_user
    current_user
  end

  private

  def stored_location
    @stored_location ||= stored_location_for(:user)
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def redirect_to_stored_location?
    stored_location.present? && stored_location != '/' && request.path != stored_location
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end
end
