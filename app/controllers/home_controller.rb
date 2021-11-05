# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @courses = Course.all.includes(:reviews, :teacher)
  end
end
