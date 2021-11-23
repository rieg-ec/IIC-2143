# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @courses = Course.all.includes(:reviews, :teacher).sort_by do |course|
      [course.reviews.length, course.average_rating]
    end.reverse!.take(20)
  end
end
