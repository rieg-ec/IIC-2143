# frozen_string_literal: true

module Api
  module V1
    class BooksController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        respond_with books
      end

      def books
        ItBookService.search(params[:subject])
      end
    end
  end
end
