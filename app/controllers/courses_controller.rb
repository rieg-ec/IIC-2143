# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    @course = Course.includes(:lectures, :students).find(params[:id])
  end

  def new
    @categories = Course.category.values
  end

  def create
    course = Course.new(course_params.merge(teacher: current_user))
    course.save!

    redirect_to course_path(course)
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :category,
      :name,
      :end_date,
      :background
    )
  end
end
