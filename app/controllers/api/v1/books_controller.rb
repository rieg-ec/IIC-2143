# frozen_string_literal: true

class Api::V1::BooksController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    respond_with books
  end

  def books
    ItBookService.search(params[:subject])
  end
end
