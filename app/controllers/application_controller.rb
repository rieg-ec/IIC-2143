# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :store_user_location!, if: :storable_location?

  def after_sign_in_path_for(resource)
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
end
