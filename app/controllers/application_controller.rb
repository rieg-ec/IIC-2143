# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  def pundit_user
    current_user
  end
end
