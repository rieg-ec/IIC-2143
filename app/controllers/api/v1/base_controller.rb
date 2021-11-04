# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ApiErrorConcern

      self.responder = ApiResponder

      respond_to :json
    end
  end
end
